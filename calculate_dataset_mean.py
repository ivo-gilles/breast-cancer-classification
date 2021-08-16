#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 18-5-18 下午7:31
# @Author  : Luo Yao
# @Site    : https://github.com/MaybeShewill-CV/lanenet-lane-detection
# @File    : train_lanenet.py
# @IDE: PyCharm Community Edition
"""
训练lanenet模型
"""
import argparse
import math
import sys,os
sys.path.append(os.getcwd())


import os.path as ops
import cv2
import numpy as np
import glob

def init_args():
    """

    :return:
    """
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset_dir', type=str, help='The training dataset dir path',
                        default='D:/Personal_Research/Dataset/Tusimple/Lane_Detection/train_set/training/gt_image')

    return parser.parse_args()


def get_mean(dataset_dir):

    images_paths = glob.glob('{:s}/????.jpg'.format(dataset_dir), recursive=True) + \
                   glob.glob('{:s}/????.png'.format(dataset_dir), recursive=True)
    mean_value = np.array([0.0, 0.0, 0.0])

    counting = 0
    for path in images_paths:
        image = cv2.imread(path)
        avg_color_per_row = np.average(image, axis=0)
        # print(avg_color_per_row)
        mean_value += np.average(avg_color_per_row, axis=0)
        # print(mean_value)
        counting += 1
        if counting % 1000 == 0:
            print(counting)
    mean_value /= len(images_paths)
    print(mean_value)

    # patch_type = '64S'

    with open(ops.join('data', 'tusimple_mean.txt'), "w") as t_file:
        for value in mean_value:
            t_file.write('{:.4f}\n'.format(value))

    return



if __name__ == '__main__':
    # init args
    args = init_args()

    # train lanenet
    get_mean(args.dataset_dir)
