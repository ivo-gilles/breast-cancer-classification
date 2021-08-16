#import sys,os
# sys.path.append(os.getcwd())

import os
import os.path as ops
import argparse
import time
import math
import random

import tensorflow as tf
import glob
import glog as log
import numpy as np
import matplotlib.pyplot as plt
import cv2

import model
import global_config

CFG = global_config.cfg
IMG_WIDTH = CFG.TEST.IMG_WIDTH
IMG_HEIGHT = CFG.TEST.IMG_HEIGHT

INP_WIDTH = CFG.TRAIN.IMG_WIDTH
INP_HEIGHT = CFG.TRAIN.IMG_HEIGHT

MEAN_40X_32S = [103.939, 116.779, 123.68]
MEAN_40X_64S = [196.9689, 166.0824, 204.7978]
MEAN_40X_32R = [103.939, 116.779, 123.68]
MEAN_40X_64R = [103.939, 116.779, 123.68]

CLASS_NAME = ['B', 'M']

def init_args():
    """

    :return:
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--image_path', type=str, help='The image path or the src image save dir',
                        default='data/test/40X')
    parser.add_argument('--weights_path', type=str, help='The model weights path',
                        default='model/40X_64S_v4/40X_64S_v4_2019-08-05-17-07-27.ckpt-0')
    parser.add_argument('--batch_size', type=int, help='The batch size of the test images', default=1)
    parser.add_argument('--save_dir', type=str, help='Test result image save dir', default='result')
    parser.add_argument('--use_gpu', type=int, help='If use gpu set 1 or 0 instead', default=1)
    parser.add_argument('--use_normalization', type=int, help='If use normalization set 1 or 0 instead', default=1)
    parser.add_argument('--start_id', type=int, help='Start index of input images', default=1)
    parser.add_argument('--end_id', type=int, help='End index of input images', default=99999)

    return parser.parse_args()

def test_net(image_dir, weights_path, use_gpu, start_id, end_id, save_dir=None):
    """
    :param image_dir:
    :param weights_path:
    :param batch_size:
    :param use_gpu:
    :param save_dir:
    :return:
    """
    assert ops.exists(image_dir), '{:s} not exist'.format(image_dir)

    # print('{:s}/*.jpg'.format(image_dir))

    image_path_list = glob.glob('{:s}/*.jpg'.format(image_dir), recursive=True) + \
                      glob.glob('{:s}/*.png'.format(image_dir), recursive=True)


    input_tensor = tf.placeholder(dtype=tf.float32, shape=[1, INP_HEIGHT, INP_WIDTH, 3], name='input_tensor')
    phase_tensor = tf.constant('test', tf.string)

    net = model.Model(phase=phase_tensor, num_classes=CFG.TRAIN.CLASSES_NUMS)
    logits, softmax, _ = net.inference(input_tensor=input_tensor, name='40X_64S_model')

    saver = tf.train.Saver()

    # Set sess configuration
    if use_gpu:
        sess_config = tf.ConfigProto(device_count={'GPU': 1})
    else:
        sess_config = tf.ConfigProto(device_count={'GPU': 0})
    sess_config.gpu_options.per_process_gpu_memory_fraction = CFG.TEST.GPU_MEMORY_FRACTION
    sess_config.gpu_options.allow_growth = CFG.TRAIN.TF_ALLOW_GROWTH
    sess_config.gpu_options.allocator_type = 'BFC'

    sess = tf.Session(config=sess_config)

    with sess.as_default():

        saver.restore(sess=sess, save_path=weights_path)

        step = 32
        size = 64

        random.shuffle(image_path_list)
        total_imgs = len(image_path_list)
        correct_imgs = 0

        end_id = min(end_id, total_imgs)

        for idx in range(start_id, end_id):
            # log.info('[Image number :{:d}] ...'.format(idx))
            image_path = image_path_list[idx]

            image_label = image_path.strip('/').split('_')[-2]

            image = cv2.imread(image_path, cv2.IMREAD_COLOR)
            image_vis = image

            image = cv2.resize(image, (IMG_WIDTH, IMG_HEIGHT),
                               interpolation=cv2.INTER_LINEAR)


            class_score = [0.0, 0.0]
            for x in range(0, IMG_WIDTH, step):
                for y in range(0, IMG_HEIGHT, step):
                    if (y + size > IMG_HEIGHT or x + size > IMG_WIDTH):
                        continue

                    patch = image[y: y + size, x:x + size] - MEAN_40X_64S
                    # patch_score = sess.run(softmax,
                    #                        feed_dict={input_tensor: [np.transpose(patch, (2, 0, 1))]})

                    patch_score = sess.run(softmax,
                                           feed_dict={input_tensor: [patch]})

                    class_score += patch_score

            label = CLASS_NAME[np.argmax(class_score)]

            if (label == image_label):
                correct_imgs += 1
                # print('The classification is correct with label {:s}'.format(label))
            # else:
            #     print('The classification is wrong')
            #     print('The correct label is {:s}, not {:s}'.format(image_label, label))

            if (idx % 100 == 0 or idx == 1):
                print('Testing the image #{:d}'.format(idx))
                # plt.ion()
                # plt.figure('input_image')
                # plt.imshow(image_vis[:, :, (2, 1, 0)])
                # plt.show()
                # plt.ioff()



        input('The accuracy is: {:.4f}%'.format(correct_imgs * 100. / total_imgs))

    sess.close()

    return


if __name__ == '__main__':
    # init args
    args = init_args()

    if args.save_dir is not None and not ops.exists(args.save_dir):
        log.error('{:s} not exist and has been made'.format(args.save_dir))
        os.makedirs(args.save_dir)

    test_net(image_dir=args.image_path, weights_path=args.weights_path,
                      save_dir=args.save_dir, use_gpu=args.use_gpu,
                      start_id=args.start_id,
                      end_id=args.end_id)
