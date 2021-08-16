import os
import os.path as ops
import argparse
import time
import math
import numpy as np

import tensorflow as tf
import model
import global_config

import cv2
from tensorflow.python.tools import freeze_graph
# from tensorflow.python.tools import optimize_for_inference

CFG = global_config.cfg

IMG_HEIGHT = CFG.TRAIN.IMG_HEIGHT
IMG_WIDTH = CFG.TRAIN.IMG_WIDTH

MEAN_40X_32S = [103.939, 116.779, 123.68]
MEAN_40X_64S = [196.9689, 166.0824, 204.7978]
MEAN_40X_32R = [103.939, 116.779, 123.68]
MEAN_40X_64R = [103.939, 116.779, 123.68]

def print_tensors(pb_file):
    print('Model File: {}\n'.format(pb_file))
    # read pb into graph_def
    with tf.gfile.GFile(pb_file, "rb") as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())

    # import graph_def
    with tf.Graph().as_default() as graph:
        tf.import_graph_def(graph_def)

    # print operations
    for op in graph.get_operations():
        print(op.name + '\t' + str(op.values()))

def freeze_graph_new(model_dir, output_node_names, weight_path):
    """Extract the sub graph defined by the output nodes and convert
    all its variables into constant
    Args:
        model_dir: the root folder containing the checkpoint state file
        output_node_names: a string, containing all the output node's names,
                            comma separated
    """
    if not tf.gfile.Exists(model_dir):
        raise AssertionError(
            "Export directory doesn't exists. Please specify an export "
            "directory: %s" % model_dir)

    if not output_node_names:
        print("You need to supply the name of a node to --output_node_names.")
        return -1

    # We precise the file fullname of our freezed graph
    # absolute_model_dir = "/".join(input_checkpoint.split('/')[:-1])
    # output_graph = absolute_model_dir + "/frozen_model.pb"

    output_graph = "frozen_model.pb"

    # We clear devices to allow TensorFlow to control on which device it will load operations
    clear_devices = True

    input_tensor = tf.placeholder(dtype=tf.float32, shape=[1, 3, IMG_HEIGHT, IMG_WIDTH], name='input_tensor')

    phase_tensor = tf.constant('test', tf.string)

    # net = densenet_model.DENSENet(phase=phase_tensor, net_flag='dense')
    # binary_seg_ret, instance_seg_ret = net.inference(input_tensor=input_tensor, name='densenet_model')

    net = model.Model(phase=phase_tensor, num_classes=CFG.TRAIN.CLASSES_NUMS)
    _, softmax, _ = net.inference(input_tensor=input_tensor, name='40X_64S_model')

    saver = tf.train.Saver()
    # We start a session using a temporary fresh Graph
    # with tf.Session(graph=tf.Graph()) as sess:

    sess_config = tf.ConfigProto(device_count={'GPU': 1})
    sess_config.gpu_options.per_process_gpu_memory_fraction = CFG.TEST.GPU_MEMORY_FRACTION
    sess_config.gpu_options.allow_growth = CFG.TRAIN.TF_ALLOW_GROWTH
    sess_config.gpu_options.allocator_type = 'BFC'

    sess = tf.Session(config=sess_config)
    with sess.as_default():
        print(weight_path)
        saver.restore(sess=sess, save_path=weight_path)

        img = cv2.imread("data/patch/40X/64S/10_SOB_B_A-14-22549AB-40-001.png", cv2.IMREAD_COLOR)

        print(img.shape)
        img = np.transpose(img, (2, 0, 1))
        print(img.shape)

        # img = cv2.resize(img, (IMG_WIDTH, IMG_HEIGHT), interpolation=cv2.INTER_LINEAR)
        class_score = sess.run(
            softmax, feed_dict={input_tensor: [img]})

        file1 = open("Node name list 2.txt", "a")
        for op in tf.get_default_graph().get_operations():
            file1.write(str(op.name))
            file1.write("\n")
        file1.close()

        # # graph = sess.graph
        # # print([node.name for node in graph.as_graph_def().node])
        # print(output_node_names.split(","))
        # # We use a built-in TF helper to export variables to constants
        # output_graph_def = tf.graph_util.convert_variables_to_constants(
        #     sess, # The session is used to retrieve the weights
        #     tf.get_default_graph().as_graph_def(), # The graph_def is used to retrieve the nodes
        #     output_node_names.split(",") # The output node names are used to select the usefull nodes
        # )
        #
        # # Finally we serialize and dump the output graph to the filesystem
        # with tf.gfile.GFile(output_graph, "wb") as f:
        #     f.write(output_graph_def.SerializeToString())
        # #print(output_graph)
        #
        # print("%d ops in the final graph." % len(output_graph_def.node))

        directory = "freeze_model"
        if not os.path.exists(directory):
            os.makedirs(directory)

        filename = "40X_64S_freeze_2"
        # Save check point for graph frozen later
        ckpt_filepath = os.path.join(directory, filename + '.ckpt')
        saver.save(sess, ckpt_filepath)
        pbtxt_filename = filename + '.pbtxt'
        pbtxt_filepath = os.path.join(directory, pbtxt_filename)
        pb_filepath = os.path.join(directory, filename + '.pb')

        # This will only save the graph but the variables will not be saved.
        # You have to freeze your model first.
        tf.train.write_graph(graph_or_graph_def=sess.graph_def, logdir=directory, name=pbtxt_filename,
                             as_text=True)

        # Freeze graph
        # Method 1
        freeze_graph.freeze_graph(input_graph=pbtxt_filepath, input_saver='', input_binary=False,
                                  input_checkpoint=ckpt_filepath, output_node_names=output_node_names,
                                  restore_op_name='save/restore_all', filename_tensor_name='save/Const:0',
                                  output_graph=pb_filepath, clear_devices=True, initializer_nodes='')


    # return output_graph_def

if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--model_dir", type=str, default="model/40X_64S_v3", help="Model folder to export")
    parser.add_argument("--weight_path", type=str, default="model/40X_64S_v3/40X_64S_v3_2019-07-25-16-11-50.ckpt-40", help="model saved weight file")
    parser.add_argument("--output_node_names", type=str, default="40X_64S_model/inference/softmax", help="The name of the output nodes, comma separated.")
    args = parser.parse_args()

    # print_tensors("model/opt_segnet_freeze.pb")
    freeze_graph_new(model_dir=args.model_dir, output_node_names=args.output_node_names, weight_path=args.weight_path)
    # print_tensors("frozen_model_2.pb")


