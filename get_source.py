#-------------------------------------------------------------------------------
# Author: Lukasz Janyst <lukasz@jany.st>
# Date:   14.06.2017
#-------------------------------------------------------------------------------

import random
import cv2

import sys,os
sys.path.append(os.getcwd())
sys.path.append("..")

import numpy as np
import tensorflow as tf

import glob
from augmentation import rotate_one, rotate_both, flip_one, flip_both, blur_one, blur_both, illumination_change_both

# BGR color
TRAIN_DATA_MEAN = [72.5099, 73.4619, 70.0471]
VGG_MEAN = [103.939, 116.779, 123.68]
MEAN_40X_32S = [103.939, 116.779, 123.68]
MEAN_40X_64S = [196.9689, 166.0824, 204.7978]
MEAN_40X_32R = [103.939, 116.779, 123.68]
MEAN_40X_64R = [103.939, 116.779, 123.68]

class SourceClassification:
    #---------------------------------------------------------------------------
    def __init__(self):
        # self.original_size = (700, 460)
        # self.scaled_size = (350, 230)
        self.image_size      = (64, 64)

        self.num_classes     = 2
        self.class_name    = {0: 'B', # Benign
                                1: 'M'} # Malignant

        self.num_training    = None
        self.num_validation  = None
        self.train_generator = None
        self.valid_generator = None

    #---------------------------------------------------------------------------
    def load_data(self, data_dir, valid_fraction):
        """
        Load the data and make the generators
        :param data_dir:       the directory where the dataset's file are stored
        :param valid_fraction: what franction of the dataset should be used
                               as a validation sample
        """

        train_paths = glob.glob('{:s}/*.png'.format(data_dir), recursive=True)

        num_images = len(train_paths)
        if num_images == 0:
            raise RuntimeError('No data files found in ' + data_dir)


        # for path in train_paths:
        #     print(path.strip('/').split('\\')[-2])
        #     input("Press Enter to continue...")

        label_list = {
            os.path.basename(path): path.strip('/').split('_')[-2]
            for path in train_paths}
        self.train_label_list = label_list

        # print(self.train_label_list[os.path.basename(train_paths[0])])

        self.num_training    = len(train_paths)
        self.train_generator = self.batch_generator(train_paths, 0)

    #---------------------------------------------------------------------------
    def batch_generator(self, image_paths, batch_type):
        def gen_batch(batch_size, names=False):
            random.shuffle(image_paths)
            for offset in range(0, len(image_paths), batch_size):
                files = image_paths[offset:offset+batch_size]

                images = []
                labels = []
                names_images = []

                counting = 0;
                while (len(files) < batch_size):
                    files.append(image_paths[counting])
                    counting += 1

                for image_file in files:
                    if (batch_type == 0):
                        label_type = self.train_label_list[os.path.basename(image_file)]
                    else:
                        label_type = self.val_label_list[os.path.basename(image_file)]

                    image = cv2.imread(image_file)*1.0 - MEAN_40X_64S
                    label = make_label_tensor(label_type)

                    # image = flip_one(image, p=0.5)
                    # image = rotate_one(image, p=0.5, ignore_label=1)
                    #image, label = blur_both(image, label, p=0.5)

                    images.append(image.astype(np.float32))
                    labels.append(label)

                    if names:
                        names_images.append(image_file)

                if names:
                    yield np.array(images), np.array(labels), \
                          names_images
                else:
                    yield np.array(images), np.array(labels)

        return gen_batch

#-------------------------------------------------------------------------------
def make_label_tensor(label_type):
    if (label_type == 'B'):
        return np.array([1., 0.])
    else:
        return np.array([0., 1.])

#-------------------------------------------------------------------------------
def get_source_classification():
    return SourceClassification()
