#-------------------------------------------------------------------------------
# Author: Lukasz Janyst <lukasz@jany.st>
# Date:   14.06.2017
#-------------------------------------------------------------------------------

import random
import cv2
import argparse

import sys,os
import os.path as ops
sys.path.append(os.getcwd())
sys.path.append("..")

from shutil import copyfile

import numpy as np

import glob

def init_args():
    """

    :return:
    """
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset_dir', type=str, help='The training dataset dir path',
                        default='D:/Personal_Research/Dataset/BreaKHis_v1/histology_slides/breast')
    parser.add_argument('--output_dir', type=str, help='The output dir of the splitted dataset',
                        default='data')
    parser.add_argument('--split_ratio', type=float, help='The pretrained weights path',
                        default=0.3)

    return parser.parse_args()

#---------------------------------------------------------------------------
def split_data(inp_dir, out_dir, split_ratio, data_type):
    """
    Load the data and make the generators
    :param data_dir:       the directory where the dataset's file are stored
    :param valid_fraction: what franction of the dataset should be used
                           as a validation sample
    """
    print("Start to split the data type {:s}...".format(data_type))

    image_paths = glob.glob('{:s}/benign/SOB/**/**/{:s}/*.png'.format(inp_dir, data_type), recursive=True) + \
                      glob.glob('{:s}/malignant/SOB/**/**/{:s}/*.png'.format(inp_dir, data_type), recursive=True)

    num_images = len(image_paths)
    if num_images == 0:
        raise RuntimeError('No data files found in ' + data_dir)

    random.shuffle(image_paths)
    test_paths = image_paths[:int(split_ratio * num_images)]
    train_paths = image_paths[int(split_ratio * num_images):]

    test_out_dir = ops.join(out_dir, 'test')
    test_out_dir = ops.join(test_out_dir, data_type)

    if not ops.exists(test_out_dir):
        os.makedirs(test_out_dir)

    train_out_dir = ops.join(out_dir, 'train')
    train_out_dir = ops.join(train_out_dir, data_type)

    if not ops.exists(train_out_dir):
        os.makedirs(train_out_dir)

    for path in train_paths:
        # print(path)
        # print(ops.join(train_out_dir, file_name))

        file_name = path.strip('/').split('/')[-1]
        copyfile(path, ops.join(train_out_dir, file_name))

        # print(path.strip('/').split('\\')[-1])
        # input("Press Enter to continue...")

    for path in test_paths:
        file_name = path.strip('/').split('/')[-1]
        copyfile(path, ops.join(test_out_dir, file_name))

        # print(path.strip('/').split('\\')[-1])
        # input("Press Enter to continue...")

    print("Finish splitting the data type {:s}...".format(data_type))


#-------------------------------------------------------------------------------
if __name__ == '__main__':
    # init args
    args = init_args()

    # split the data to train and test set
    split_data(inp_dir=args.dataset_dir, out_dir=args.output_dir,
               split_ratio=args.split_ratio, data_type='40X')

    split_data(inp_dir=args.dataset_dir, out_dir=args.output_dir,
               split_ratio=args.split_ratio, data_type='100X')

    split_data(inp_dir=args.dataset_dir, out_dir=args.output_dir,
               split_ratio=args.split_ratio, data_type='200X')

    split_data(inp_dir=args.dataset_dir, out_dir=args.output_dir,
               split_ratio=args.split_ratio, data_type='400X')