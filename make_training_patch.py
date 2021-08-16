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

PATCH_TYPE = ['32S', '64S', '32R', '64R']

def init_args():
    """

    :return:
    """
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset_dir', type=str, help='The training dataset dir path',
                        default='data/train')
    parser.add_argument('--output_dir', type=str, help='The output dir of the splitted dataset',
                        default='data/patch')

    return parser.parse_args()

#---------------------------------------------------------------------------
def get_mean_value(image):
    avg_color_per_row = np.average(image, axis=0)
    mean_value = np.average(avg_color_per_row, axis=0)
    return mean_value

#---------------------------------------------------------------------------
def make_sliding_ROI(inp_dir, out_dir, size):
    img = cv2.resize(cv2.imread(inp_dir), (230, 350))
    height = img.shape[0]
    width = img.shape[1]
    # print(height, width)

    # file_name = inp_dir.strip('/').split('\\')[-1]
    file_name = inp_dir.strip('/').split('/')[-1]
    num_patch = 0
    step = size >> 1

    # print(step, size)

    mean_value = np.array([0.0, 0.0, 0.0])
    for x in range(0, width, step):
        for y in range(0, height, step):
            if (y + size > height or x + size > width):
                # print(x, y)
                continue

            patch = img[y: y + size, x :x + size]
            patch_name = '{:d}_{:s}'.format(num_patch + 1, file_name)
            cv2.imwrite(ops.join(out_dir, patch_name), patch)
            mean_value += get_mean_value(patch)
            num_patch += 1

    # print(num_patch)
    #
    # input("Finish to generate patches from 1 input image")

    return mean_value, num_patch

#---------------------------------------------------------------------------
def make_random_ROI(inp_dir, out_dir, size):
    img = cv2.resize(cv2.imread(inp_dir), (230, 350))

    height = img.shape[0]
    width = img.shape[1]

    file_name = inp_dir.strip('/').split('\\')[-1]
    num_patch = 0

    mean_value = np.array([0.0, 0.0, 0.0])

    label.append([-1, -1])

    while (num_patch < 1000):
        x = random(0, width) - 1
        y = random(0, height) - 1

        if (label.count([x, y] > 0)):
            continue

        if (y + size > height or x + size > width):
            continue

        label.append([x, y])
        patch = img[y: y + size, x :x + size]
        patch_name = '{:d}_{:s}'.format(num_patch + 1, file_name)
        cv2.imwrite(ops.join(out_dir, patch_name), patch)
        mean_value += get_mean_value(patch)
        num_patch += 1

    print(label)
    print(num_patch)

    input("Finish to generate patches from 1 input image")

    return mean_value, num_patch

#---------------------------------------------------------------------------
def make_ROI_by_type(inp_dir, out_dir, ROI_type):

    if (ROI_type == '32S'):
        mean_value, num_patch = make_sliding_ROI(inp_dir, out_dir, 32)
    elif (ROI_type == '64S'):
        mean_value, num_patch = make_sliding_ROI(inp_dir, out_dir,64)
    elif (ROI_type == '32R'):
        mean_value, num_patch = make_random_ROI(inp_dir, out_dir, 32)
    else:
        mean_value, num_patch = make_random_ROI(inp_dir, out_dir, 64)

    return mean_value, num_patch

#---------------------------------------------------------------------------
def make_patch(inp_dir, out_dir, data_type):
    """
    Load the data and make the generators
    :param data_dir:       the directory where the dataset's file are stored
    :param valid_fraction: what franction of the dataset should be used
                           as a validation sample
    """
    print("Start to make the training patch type {:s}...".format(data_type))

    image_paths = glob.glob('{:s}/{:s}/*.png'.format(inp_dir, data_type), recursive=True)

    num_images = len(image_paths)
    if num_images == 0:
        raise RuntimeError('No data files found in ' + data_dir)

    patch_type = PATCH_TYPE[1] # 64x64 sliding window strategy
    patch_out_dir_1 = ops.join(out_dir, data_type)
    patch_out_dir_2 = ops.join(patch_out_dir_1, patch_type)

    if not ops.exists(patch_out_dir_2):
        os.makedirs(patch_out_dir_2)

    total_value = np.array([0.0, 0.0, 0.0])
    total_patch = 0

    for path in image_paths:
        mean, amount = make_ROI_by_type(path, patch_out_dir_2, patch_type)

        total_value += mean
        total_patch += amount

    mean_value = total_value / total_patch
    print(mean_value)

    with open(ops.join(patch_out_dir_1, 'mean_{:s}.txt'.format(patch_type)), "w") as t_file:
        for value in mean_value:
            t_file.write('{:.4f}\n'.format(value))

    print("Finish splitting the data type {:s}...".format(data_type))


#-------------------------------------------------------------------------------
if __name__ == '__main__':
    # init args
    args = init_args()

    # split the data to train and test set
    make_patch(inp_dir=args.dataset_dir, out_dir=args.output_dir,
               data_type='40X')

    # make_patch(inp_dir=args.dataset_dir, out_dir=args.output_dir,
    #            data_type='100X')
    #
    # make_patch(inp_dir=args.dataset_dir, out_dir=args.output_dir,
    #            data_type='200X')
    #
    # make_patch(inp_dir=args.dataset_dir, out_dir=args.output_dir,
    #            data_type='400X')