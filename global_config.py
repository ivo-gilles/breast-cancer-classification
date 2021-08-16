from easydict import EasyDict as edict

__C = edict()
# Consumers can get config by: from config import cfg

cfg = __C

# Train options
__C.TRAIN = edict()

# Set the shadownet training epochs
__C.TRAIN.EPOCHS = 1
# Set the display step
__C.TRAIN.DISPLAY_STEP = 5
# Set the test display step during training process
__C.TRAIN.TEST_DISPLAY_STEP = 5
# Set the saving model step during training process
__C.TRAIN.SAVE_MODEL_STEP = 10
# Set the momentum parameter of the optimizer
__C.TRAIN.MOMENTUM = 0.9
# Set the initial learning rate
__C.TRAIN.LEARNING_RATE = 0.0005
# Set the GPU resource used during training process
__C.TRAIN.GPU_MEMORY_FRACTION = 0.9
# Set the GPU allow growth parameter during tensorflow training process
__C.TRAIN.TF_ALLOW_GROWTH = True
# Set the shadownet training batch size
__C.TRAIN.BATCH_SIZE = 8

# Set the shadownet validation batch size
__C.TRAIN.VAL_BATCH_SIZE = 8
# Set the learning rate decay steps
__C.TRAIN.LR_DECAY_STEPS = 80
# Set the learning rate decay rate
__C.TRAIN.LR_DECAY_RATE = 0.1
# Set the class numbers
__C.TRAIN.CLASSES_NUMS = 2
# Set the image height
__C.TRAIN.IMG_HEIGHT = 64
# Set the image width
__C.TRAIN.IMG_WIDTH = 64

# Test options
__C.TEST = edict()

# Set the GPU resource used during testing process
__C.TEST.GPU_MEMORY_FRACTION = 0.8
# Set the GPU allow growth parameter during tensorflow testing process
__C.TEST.TF_ALLOW_GROWTH = True
# Set the test batch size
__C.TEST.BATCH_SIZE = 1
# Set the test image height
__C.TEST.IMG_HEIGHT = 230
# Set the test image width
__C.TEST.IMG_WIDTH = 350
