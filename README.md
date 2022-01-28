# breast-cancer-classification

This repo contains the end-to-end process from preparing training data, training and testing deep model from this paper [Breast cancer histopathological image classification using Convolutional Neural Networks](https://ieeexplore.ieee.org/document/7727519)
Due to this work was made during my Ph.D course in 2019, it's better to install old Tensorflow library for running it (1.13 version).
For the part that using OpenCV library to run the trained model in C++, I will try to update it ASAP.

Original dataset link: [Breast Cancer Histopathological Database (BreakHis)](https://web.inf.ufpr.br/vri/databases/breast-cancer-histopathological-database-breakhis/)

## Step 1:
python split_train_test_data.py --dataset_dir 'D:/Personal_Research/Dataset/BreaKHis_v1/histology_slides/breast'

## Step 2:
python make_training_patch.py

## Step 3:
Copy the mean value from the mean_64S.txt to line #22 of get_source.py file
Run the command:
python full_train_net_simple.py

# Notice:
_ You should replace dataset_dir to the direction on your computer

_ The function should be called inside the folder terminal

_ You can change the batch training size in the global_config.py file, line #28
