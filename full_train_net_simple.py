"""
Simple classification model
"""
import argparse
import math
import sys,os
sys.path.append(os.getcwd())
import os.path as ops
import time

import cv2
import glog as log
import numpy as np
import tensorflow as tf
from tqdm import tqdm


import model
import get_source
import global_config

CFG = global_config.cfg
IMG_WIDTH = CFG.TRAIN.IMG_WIDTH
IMG_HEIGHT = CFG.TRAIN.IMG_HEIGHT

MEAN_40X_32S = [103.939, 116.779, 123.68]
MEAN_40X_64S = [196.9689, 166.0824, 204.7978]
MEAN_40X_32R = [103.939, 116.779, 123.68]
MEAN_40X_64R = [103.939, 116.779, 123.68]

# Declare the network parameter


def init_args():
    """

    :return:
    """
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset_dir', type=str, help='The training dataset dir path', default='data/patch/40X/64S')
    parser.add_argument('--batch_size', type=int, help='The number of images per batch', default=2)
    parser.add_argument('--weights_path', type=str, help='The pretrained weights path')

    return parser.parse_args()

def train_net(dataset_dir, weights_path=None, batch_size=2):
    """
    :param dataset_dir:
    :param weights_path: path to the pre-trained weight files
    :param batch_size:
    :return:
    """

    source = get_source.get_source_classification()
    source.load_data(dataset_dir, 0.3)
    train_generator = source.train_generator

    with tf.device('/gpu:0'):
        input_tensor = tf.placeholder(dtype=tf.float32,
                                      shape=[CFG.TRAIN.BATCH_SIZE, CFG.TRAIN.IMG_HEIGHT,
                                             CFG.TRAIN.IMG_WIDTH, 3],
                                      name='input_tensor')

        class_label_tensor = tf.placeholder(dtype=tf.float32,
                                               shape=[CFG.TRAIN.BATCH_SIZE, CFG.TRAIN.CLASSES_NUMS],
                                               name='class_input_label')
        phase = tf.placeholder(dtype=tf.string, shape=None, name='net_phase')

        class_label = tf.argmax(class_label_tensor, axis=-1)

        net = model.Model(num_classes=CFG.TRAIN.CLASSES_NUMS, phase=phase)

        # calculate the loss
        compute_ret = net.compute_loss(input_tensor=input_tensor,
                                       label_tensor=class_label_tensor, name='40X_64S_model')
        total_loss = compute_ret['total_loss']
        final_class = tf.argmax(compute_ret['instance_class_softmax'], -1)

        # calculate the accuracy
        accu, acc_op = tf.metrics.accuracy(labels=class_label, predictions=final_class)

        global_step = tf.Variable(0, trainable=False)
        learning_rate = tf.train.exponential_decay(CFG.TRAIN.LEARNING_RATE, global_step,
                                                   100000, 0.1, staircase=True)
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)

        with tf.control_dependencies(update_ops):
            optimizer = tf.train.MomentumOptimizer(
                learning_rate=learning_rate, momentum=0.9).minimize(loss=total_loss,
                                                                    var_list=tf.trainable_variables(),
                                                                    global_step=global_step)

    # Set tf saver
    saver = tf.train.Saver()
    model_save_dir = 'model/40X_64S_v4'
    if not ops.exists(model_save_dir):
        os.makedirs(model_save_dir)
    train_start_time = time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime(time.time()))
    model_name = '40X_64S_v4_{:s}.ckpt'.format(str(train_start_time))
    model_save_path = ops.join(model_save_dir, model_name)

    # Set tf summary
    tboard_save_path = 'tboard/40X_64S_v4'
    if not ops.exists(tboard_save_path):
        os.makedirs(tboard_save_path)
    train_cost_scalar = tf.summary.scalar(name='train_cost', tensor=total_loss)
    train_accuracy_scalar = tf.summary.scalar(name='train_accuracy', tensor=acc_op)
    learning_rate_scalar = tf.summary.scalar(name='learning_rate', tensor=learning_rate)

    train_merge_summary_op = tf.summary.merge([train_accuracy_scalar, train_cost_scalar,
                                               learning_rate_scalar])

    # Set sess configuration
    sess_config = tf.ConfigProto(allow_soft_placement=True)
    sess_config.gpu_options.per_process_gpu_memory_fraction = CFG.TRAIN.GPU_MEMORY_FRACTION
    sess_config.gpu_options.allow_growth = CFG.TRAIN.TF_ALLOW_GROWTH
    sess_config.gpu_options.allocator_type = 'BFC'

    sess = tf.Session(config=sess_config)

    summary_writer = tf.summary.FileWriter(tboard_save_path)
    summary_writer.add_graph(sess.graph)

    # Set the training parameters
    train_epochs = CFG.TRAIN.EPOCHS

    log.info('Global configuration is as follows:')
    log.info(CFG)

    with sess.as_default():

        devices = sess.list_devices()
        print(devices)

        tf.train.write_graph(graph_or_graph_def=sess.graph, logdir='',
                             name='{:s}/simple_classification.pb'.format(model_save_dir))

        init_op = tf.group(tf.initializers.global_variables(),
                           tf.initializers.local_variables())
        sess.run(init_op)

        if weights_path is None:
            log.info('Training from scratch')
            init_g = tf.global_variables_initializer()
            sess.run(init_g)
        else:
            log.info('Restore model from last model checkpoint {:s}'.format(weights_path))
            saver.restore(sess=sess, save_path=weights_path)

        train_cost_time_mean = []

        n_train_batches = int(math.ceil(source.num_training / CFG.TRAIN.BATCH_SIZE))

        for epoch in range(train_epochs):
            # training part
            t_start = time.time()

            generator = train_generator(CFG.TRAIN.BATCH_SIZE)
            description = '[i] Epoch {:>2}/{}'.format(epoch + 1, train_epochs)
            phase_train = 'train'

            imgs = None

            counting = 0

            for x, y in tqdm(generator, total=n_train_batches,
                         desc=description, unit='batches'):

                # trans_x = np.transpose(x, (0, 3, 1, 2))
                # print(trans_x.shape)

                _, c, inferred_class, train_summary, train_accuracy, y_mapped = \
                    sess.run([optimizer, total_loss,
                              final_class,
                              train_merge_summary_op,
                              acc_op, class_label],
                             feed_dict={input_tensor: x,
                                        class_label_tensor: y,
                                        phase: phase_train})

                # counting += 1
                # if counting == 10: break

                if imgs is None:
                    imgs = x[0]
                    img_labels_gt = y_mapped[0]

            if math.isnan(c):
                log.error('cost is: {:.5f}'.format(c))
                cv2.putText(imgs, source.class_name[img_labels_gt], (100, 100), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2, cv2.LINE_AA)
                cv2.imwrite(ops.join(model_save_dir, 'nan_image.png'), imgs)
                return


            if epoch % CFG.TRAIN.DISPLAY_STEP == 0:
                cv2.putText(imgs, source.class_name[img_labels_gt], (100, 100), cv2.FONT_HERSHEY_SIMPLEX, 0.8,
                            (0, 255, 0), 2, cv2.LINE_AA)
                cv2.imwrite(ops.join(model_save_dir, 'image.png'), imgs)

            cost_time = time.time() - t_start
            train_cost_time_mean.append(cost_time)
            summary_writer.add_summary(summary=train_summary, global_step=epoch)

            if epoch % CFG.TRAIN.DISPLAY_STEP == 0:
                log.info('Epoch: {:d} total_loss= {:6f} ' 
                         'accuracy= {:6f}'
                         ' mean_cost_time= {:5f}s '.
                         format(epoch + 1, c, train_accuracy,
                                np.mean(train_cost_time_mean)))
                train_cost_time_mean.clear()

            if epoch % CFG.TRAIN.SAVE_MODEL_STEP == 0:
                saver.save(sess=sess, save_path=model_save_path, global_step=epoch)
    sess.close()

    return



if __name__ == '__main__':
    # init args
    args = init_args()

    # train simple classification net
    train_net(args.dataset_dir, args.weights_path, batch_size=args.batch_size)
