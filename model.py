import tensorflow as tf

import cnn_basenet
from collections import OrderedDict

class Model(cnn_basenet.CNNBaseModel):
    def __init__(self, phase, num_classes):
        super(Model, self).__init__()
        self._phase = phase
        self._num_classes = num_classes

    def __str__(self):
        """
        :return:
        """
        info = 'Simple CNN model to do classification'
        return info

    def _conv_stage(self, input_tensor, k_size, out_dims, name,
                    stride=1, pad='SAME', bias=False, data_format='NHWC'):
        with tf.variable_scope(name):
            conv = self.conv2d(inputdata=input_tensor, out_channel=out_dims,
                               kernel_size=k_size, stride=stride,
                               use_bias=bias, padding=pad, name='conv', data_format=data_format)
            # batch norm layer is used in VGG net
            # bn = self.layerbn(inputdata=conv, is_training=self._is_training, name='bn')

            relu = self.relu(inputdata=conv, name='relu')

            return relu

    def _fc_stage(self, input_tensor, out_dims, name, use_bias=False):
        with tf.variable_scope(name):
            fc = self.fullyconnect(inputdata=input_tensor, out_dim=out_dims, use_bias=use_bias,
                                   name='fc')
            # batch norm layer is used in VGG net
            # bn = self.layerbn(inputdata=fc, is_training=self._is_training, name='bn')

            relu = self.relu(inputdata=fc, name='relu')

        return relu

    def _build_model(self, input_tensor, name):
        ret = OrderedDict()

        # trans_input = tf.expand_dims(tf.transpose(input_tensor[0], [1, 2, 0]), 0)
        # shape = input_tensor.shape
        #
        # for n in range(1, shape[0]):
        #     trans_input = tf.concat((trans_input,
        #                              tf.expand_dims(tf.transpose(input_tensor[n], [1, 2, 0]), 0)), 0)

        with tf.variable_scope(name):
            # convert from NCHW to NHWC
            # trans_tensor = tf.transpose(input_tensor, [0, 2, 3, 1],
            #                           name='transpose_tensor')

            # conv stage 1
            conv1 = self._conv_stage(input_tensor=input_tensor, out_dims=64,
                                     k_size=5, bias=True, name='conv1', data_format='NCHW')

            # pool stage 1
            pool1 = self.maxpooling(inputdata=conv1, kernel_size=3,
                                    stride=2, name='pool1', data_format='NCHW')

            # conv stage 2
            conv2 = self._conv_stage(input_tensor=pool1, out_dims=32,
                                     k_size=5, bias=True, name='conv2', data_format='NCHW')

            # pool stage 2
            pool2 = self.avgpooling(inputdata=conv2, kernel_size=3,
                                    stride=2, name='pool2', data_format='NCHW')

            # conv stage 3
            conv3 = self._conv_stage(input_tensor=pool2, out_dims=64,
                                     k_size=5, bias=True, name='conv3', data_format='NCHW')

            # pool stage 3
            pool3 = self.avgpooling(inputdata=conv3, kernel_size=3,
                                    stride=2, name='pool2', data_format='NCHW')

            # fc stage 1
            fc1 = self._fc_stage(input_tensor=pool3, out_dims=64, name='fc1',
                                 use_bias=False)

            # fc stage 2
            # fc2 = self._fc_stage(input_tensor=fc1, out_dims=self._num_classes, name='logits',
            #                      use_bias=False)
            fc2 = self.fullyconnect(inputdata=fc1, out_dim=self._num_classes, use_bias=False,
                         name='fc2')


            ret['final_layer'] = dict()
            ret['final_layer']['data'] = fc2
            ret['final_layer']['shape'] = fc2.get_shape().as_list()

            softmax = tf.nn.softmax(fc2, name='softmax')
            label = tf.argmax(softmax, axis=-1, name='score')

            ret['result'] = dict()
            ret['result']['logits'] = fc2
            ret['result']['softmax'] = softmax
            ret['result']['label'] = label

            return ret

    def compute_loss(self, input_tensor, label_tensor, name):
        with tf.variable_scope(name):
            inference_ret = self._build_model(input_tensor=input_tensor, name='inference')
            logits = inference_ret['result']['logits']

            losses = tf.nn.softmax_cross_entropy_with_logits(
                labels=label_tensor,
                logits=logits)

            loss = tf.reduce_mean(losses)

            softmax = inference_ret['result']['softmax']

            ret = {
                'total_loss': loss,
                'instance_class_logits': logits,
                'instance_class_softmax': softmax
            }

            return ret

    def inference(self, input_tensor, name):
        with tf.variable_scope(name):
            inference_ret = self._build_model(input_tensor=input_tensor, name='inference')
            logits = inference_ret['result']['logits']
            softmax = inference_ret['result']['softmax']
            final_label = inference_ret['result']['label']

            return logits, softmax, final_label
