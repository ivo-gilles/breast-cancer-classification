node {
  name: "input_tensor"
  op: "Placeholder"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "class_input_label"
  op: "Placeholder"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
        dim {
          size: 2
        }
      }
    }
  }
}
node {
  name: "net_phase"
  op: "Placeholder"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "class_input_label"
  input: "ArgMax/dimension"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.18618986010551453
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal"
  op: "Add"
  input: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/mul"
  input: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/W"
  input: "40X_64S_model/inference/conv1/conv/W/Initializer/truncated_normal"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv1/conv/W"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/b"
  input: "40X_64S_model/inference/conv1/conv/b/Initializer/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv1/conv/b"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/Conv2D"
  op: "Conv2D"
  input: "input_tensor"
  input: "40X_64S_model/inference/conv1/conv/W/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/BiasAdd"
  op: "BiasAdd"
  input: "40X_64S_model/inference/conv1/conv/Conv2D"
  input: "40X_64S_model/inference/conv1/conv/b/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/conv"
  op: "Identity"
  input: "40X_64S_model/inference/conv1/conv/BiasAdd"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/relu"
  op: "Relu"
  input: "40X_64S_model/inference/conv1/conv/conv"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/pool1"
  op: "MaxPool"
  input: "40X_64S_model/inference/conv1/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000@\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.040311288088560104
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal"
  op: "Add"
  input: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/mul"
  input: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 64
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/W"
  input: "40X_64S_model/inference/conv2/conv/W/Initializer/truncated_normal"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv2/conv/W"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/b"
  input: "40X_64S_model/inference/conv2/conv/b/Initializer/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv2/conv/b"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/Conv2D"
  op: "Conv2D"
  input: "40X_64S_model/inference/pool1"
  input: "40X_64S_model/inference/conv2/conv/W/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/BiasAdd"
  op: "BiasAdd"
  input: "40X_64S_model/inference/conv2/conv/Conv2D"
  input: "40X_64S_model/inference/conv2/conv/b/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/conv"
  op: "Identity"
  input: "40X_64S_model/inference/conv2/conv/BiasAdd"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/relu"
  op: "Relu"
  input: "40X_64S_model/inference/conv2/conv/conv"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/pool2"
  op: "AvgPool"
  input: "40X_64S_model/inference/conv2/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0570087730884552
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/TruncatedNormal"
  input: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal"
  op: "Add"
  input: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/mul"
  input: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/W"
  input: "40X_64S_model/inference/conv3/conv/W/Initializer/truncated_normal"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv3/conv/W"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/b"
  input: "40X_64S_model/inference/conv3/conv/b/Initializer/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv3/conv/b"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/Conv2D"
  op: "Conv2D"
  input: "40X_64S_model/inference/pool2"
  input: "40X_64S_model/inference/conv3/conv/W/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/BiasAdd"
  op: "BiasAdd"
  input: "40X_64S_model/inference/conv3/conv/Conv2D"
  input: "40X_64S_model/inference/conv3/conv/b/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/conv"
  op: "Identity"
  input: "40X_64S_model/inference/conv3/conv/BiasAdd"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/relu"
  op: "Relu"
  input: "40X_64S_model/inference/conv3/conv/conv"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/pool2_1"
  op: "AvgPool"
  input: "40X_64S_model/inference/conv3/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/Reshape/shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377@\014\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/Reshape"
  op: "Reshape"
  input: "40X_64S_model/inference/pool2_1"
  input: "40X_64S_model/inference/fc1/Reshape/shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\014\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.028793778270483017
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/TruncatedNormal"
  input: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal"
  op: "Add"
  input: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/mul"
  input: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/fc1/fc/kernel"
  input: "40X_64S_model/inference/fc1/fc/kernel/Initializer/truncated_normal"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/read"
  op: "Identity"
  input: "40X_64S_model/inference/fc1/fc/kernel"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/MatMul"
  op: "MatMul"
  input: "40X_64S_model/inference/fc1/Reshape"
  input: "40X_64S_model/inference/fc1/fc/kernel/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/output"
  op: "Identity"
  input: "40X_64S_model/inference/fc1/fc/MatMul"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/relu"
  op: "Relu"
  input: "40X_64S_model/inference/fc1/fc/output"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/Reshape/shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/Reshape"
  op: "Reshape"
  input: "40X_64S_model/inference/fc1/relu"
  input: "40X_64S_model/inference/Reshape/shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.20155644416809082
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/mul"
  op: "Mul"
  input: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/TruncatedNormal"
  input: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal"
  op: "Add"
  input: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/mul"
  input: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/fc2/kernel"
  input: "40X_64S_model/inference/fc2/kernel/Initializer/truncated_normal"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/read"
  op: "Identity"
  input: "40X_64S_model/inference/fc2/kernel"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/MatMul"
  op: "MatMul"
  input: "40X_64S_model/inference/Reshape"
  input: "40X_64S_model/inference/fc2/kernel/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/output"
  op: "Identity"
  input: "40X_64S_model/inference/fc2/MatMul"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/softmax"
  op: "Softmax"
  input: "40X_64S_model/inference/fc2/output"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/inference/score/dimension"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/score"
  op: "ArgMax"
  input: "40X_64S_model/inference/softmax"
  input: "40X_64S_model/inference/score/dimension"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  op: "StopGradient"
  input: "class_input_label"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Rank"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\010\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Rank_1"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Shape_1"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\010\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub/y"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub"
  op: "Sub"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Rank_1"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub/y"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice/begin"
  op: "Pack"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice/size"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice"
  op: "Slice"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Shape_1"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice/begin"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice/size"
  device: "/device:GPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat/values_0"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat/axis"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat"
  op: "ConcatV2"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat/values_0"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat/axis"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape"
  op: "Reshape"
  input: "40X_64S_model/inference/fc2/output"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Rank_2"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Shape_2"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\010\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_1/y"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_1"
  op: "Sub"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Rank_2"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_1/y"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_1/begin"
  op: "Pack"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_1"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_1/size"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_1"
  op: "Slice"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Shape_2"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_1/begin"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_1/size"
  device: "/device:GPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat_1/values_0"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat_1/axis"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat_1"
  op: "ConcatV2"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat_1/values_0"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_1"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat_1/axis"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_1"
  op: "Reshape"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/labels_stop_gradient"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/concat_1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg"
  op: "SoftmaxCrossEntropyWithLogits"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_2/y"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_2"
  op: "Sub"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Rank"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_2/y"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_2/begin"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_2/size"
  op: "Pack"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Sub_2"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_2"
  op: "Slice"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Shape"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_2/begin"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_2/size"
  device: "/device:GPU:0"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2"
  op: "Reshape"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Slice_2"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "40X_64S_model/Mean"
  op: "Mean"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2"
  input: "40X_64S_model/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "ArgMax_1/dimension"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "ArgMax_1"
  op: "ArgMax"
  input: "40X_64S_model/inference/softmax"
  input: "ArgMax_1/dimension"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "ArgMax_1"
  input: "ArgMax"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ToFloat"
  op: "Cast"
  input: "Equal"
  device: "/device:GPU:0"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "accuracy/total/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/total"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "accuracy/total"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/total"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "accuracy/total/Assign"
  op: "Assign"
  input: "accuracy/total"
  input: "accuracy/total/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/total"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "accuracy/total/read"
  op: "Identity"
  input: "accuracy/total"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/total"
      }
    }
  }
}
node {
  name: "accuracy/count/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/count"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "accuracy/count"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/count"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "accuracy/count/Assign"
  op: "Assign"
  input: "accuracy/count"
  input: "accuracy/count/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/count"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "accuracy/count/read"
  op: "Identity"
  input: "accuracy/count"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/count"
      }
    }
  }
}
node {
  name: "accuracy/Size"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "accuracy/ToFloat"
  op: "Cast"
  input: "accuracy/Size"
  device: "/device:GPU:0"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "accuracy/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "accuracy/Sum"
  op: "Sum"
  input: "ToFloat"
  input: "accuracy/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "accuracy/AssignAdd"
  op: "AssignAdd"
  input: "accuracy/total"
  input: "accuracy/Sum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/total"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "accuracy/AssignAdd_1"
  op: "AssignAdd"
  input: "accuracy/count"
  input: "accuracy/ToFloat"
  input: "^ToFloat"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@accuracy/count"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "accuracy/truediv"
  op: "RealDiv"
  input: "accuracy/total/read"
  input: "accuracy/count/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/zeros_like"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "accuracy/Greater"
  op: "Greater"
  input: "accuracy/count/read"
  input: "accuracy/zeros_like"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/value"
  op: "Select"
  input: "accuracy/Greater"
  input: "accuracy/truediv"
  input: "accuracy/zeros_like"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/truediv_1"
  op: "RealDiv"
  input: "accuracy/AssignAdd"
  input: "accuracy/AssignAdd_1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/zeros_like_1"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "accuracy/Greater_1"
  op: "Greater"
  input: "accuracy/AssignAdd_1"
  input: "accuracy/zeros_like_1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "accuracy/update_op"
  op: "Select"
  input: "accuracy/Greater_1"
  input: "accuracy/truediv_1"
  input: "accuracy/zeros_like_1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable/initial_value"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Variable"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "Variable/initial_value"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "ExponentialDecay/learning_rate"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0005000000237487257
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast/x"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100000
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast"
  op: "Cast"
  input: "ExponentialDecay/Cast/x"
  device: "/device:GPU:0"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1/x"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast_2"
  op: "Cast"
  input: "Variable/read"
  device: "/device:GPU:0"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "ExponentialDecay/truediv"
  op: "RealDiv"
  input: "ExponentialDecay/Cast_2"
  input: "ExponentialDecay/Cast"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Floor"
  op: "Floor"
  input: "ExponentialDecay/truediv"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Pow"
  op: "Pow"
  input: "ExponentialDecay/Cast_1/x"
  input: "ExponentialDecay/Floor"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay"
  op: "Mul"
  input: "ExponentialDecay/learning_rate"
  input: "ExponentialDecay/Pow"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/Mean_grad/Reshape/shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/40X_64S_model/Mean_grad/Reshape/shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/Mean_grad/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/40X_64S_model/Mean_grad/Reshape"
  input: "gradients/40X_64S_model/Mean_grad/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/Mean_grad/Const_1"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 8.0
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/40X_64S_model/Mean_grad/Tile"
  input: "gradients/40X_64S_model/Mean_grad/Const_1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 8
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/40X_64S_model/Mean_grad/truediv"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_like"
  op: "ZerosLike"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg:1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul"
  op: "Mul"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg:1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax"
  op: "LogSoftmax"
  input: "40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/Neg"
  op: "Neg"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1"
  op: "ExpandDims"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Reshape"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  op: "Mul"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/Neg"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul"
  input: "^gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul"
  input: "^gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul_1"
  input: "^gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/mul_1"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\010\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  input: "40X_64S_model/inference/fc2/kernel/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "40X_64S_model/inference/Reshape"
  input: "gradients/40X_64S_model/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul"
  input: "^gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul_1"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul"
  input: "^gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul_1"
  input: "^gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/fc2/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/Reshape_grad/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\010\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/control_dependency"
  input: "gradients/40X_64S_model/inference/Reshape_grad/Shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/40X_64S_model/inference/Reshape_grad/Reshape"
  input: "40X_64S_model/inference/fc1/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/40X_64S_model/inference/fc1/relu_grad/ReluGrad"
  input: "40X_64S_model/inference/fc1/fc/kernel/read"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "40X_64S_model/inference/fc1/Reshape"
  input: "gradients/40X_64S_model/inference/fc1/relu_grad/ReluGrad"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul"
  input: "^gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul_1"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul"
  input: "^gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul_1"
  input: "^gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/Reshape_grad/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\010\000\000\000\007\000\000\000\007\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/fc1/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/control_dependency"
  input: "gradients/40X_64S_model/inference/fc1/Reshape_grad/Shape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/pool2_1_grad/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\010\000\000\000\017\000\000\000\017\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/pool2_1_grad/AvgPoolGrad"
  op: "AvgPoolGrad"
  input: "gradients/40X_64S_model/inference/pool2_1_grad/Shape"
  input: "gradients/40X_64S_model/inference/fc1/Reshape_grad/Reshape"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/40X_64S_model/inference/pool2_1_grad/AvgPoolGrad"
  input: "40X_64S_model/inference/conv3/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/40X_64S_model/inference/conv3/relu_grad/ReluGrad"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/40X_64S_model/inference/conv3/relu_grad/ReluGrad"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv3/relu_grad/ReluGrad"
  input: "^gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv3/relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "40X_64S_model/inference/pool2"
  input: "40X_64S_model/inference/conv3/conv/W/read"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/ShapeN"
  input: "40X_64S_model/inference/conv3/conv/W/read"
  input: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "40X_64S_model/inference/pool2"
  input: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/ShapeN:1"
  input: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropInput"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/pool2_grad/Shape"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\010\000\000\000 \000\000\000 \000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/pool2_grad/AvgPoolGrad"
  op: "AvgPoolGrad"
  input: "gradients/40X_64S_model/inference/pool2_grad/Shape"
  input: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/40X_64S_model/inference/pool2_grad/AvgPoolGrad"
  input: "40X_64S_model/inference/conv2/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/40X_64S_model/inference/conv2/relu_grad/ReluGrad"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/40X_64S_model/inference/conv2/relu_grad/ReluGrad"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv2/relu_grad/ReluGrad"
  input: "^gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv2/relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "40X_64S_model/inference/pool1"
  input: "40X_64S_model/inference/conv2/conv/W/read"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/ShapeN"
  input: "40X_64S_model/inference/conv2/conv/W/read"
  input: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "40X_64S_model/inference/pool1"
  input: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/ShapeN:1"
  input: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropInput"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/pool1_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "40X_64S_model/inference/conv1/relu"
  input: "40X_64S_model/inference/pool1"
  input: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/40X_64S_model/inference/pool1_grad/MaxPoolGrad"
  input: "40X_64S_model/inference/conv1/relu"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/40X_64S_model/inference/conv1/relu_grad/ReluGrad"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/40X_64S_model/inference/conv1/relu_grad/ReluGrad"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv1/relu_grad/ReluGrad"
  input: "^gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv1/relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "input_tensor"
  input: "40X_64S_model/inference/conv1/conv/W/read"
  device: "/device:GPU:0"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/ShapeN"
  input: "40X_64S_model/inference/conv1/conv/W/read"
  input: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "input_tensor"
  input: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/ShapeN:1"
  input: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/control_dependency"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropInput"
  device: "/device:GPU:0"
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/tuple/group_deps"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Momentum/Initializer/zeros/shape_as_tensor"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Momentum/Initializer/zeros/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Momentum/Initializer/zeros"
  op: "Fill"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum/Initializer/zeros/shape_as_tensor"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum/Initializer/zeros/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/W/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/Momentum/Initializer/zeros"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/b/Momentum"
  input: "40X_64S_model/inference/conv1/conv/b/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv1/conv/b/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv1/conv/b/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Momentum/Initializer/zeros/shape_as_tensor"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000@\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Momentum/Initializer/zeros/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Momentum/Initializer/zeros"
  op: "Fill"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum/Initializer/zeros/shape_as_tensor"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum/Initializer/zeros/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 64
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/W/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/Momentum/Initializer/zeros"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/b/Momentum"
  input: "40X_64S_model/inference/conv2/conv/b/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv2/conv/b/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv2/conv/b/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Momentum/Initializer/zeros/shape_as_tensor"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Momentum/Initializer/zeros/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Momentum/Initializer/zeros"
  op: "Fill"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum/Initializer/zeros/shape_as_tensor"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum/Initializer/zeros/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/W/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/Momentum/Initializer/zeros"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/b/Momentum"
  input: "40X_64S_model/inference/conv3/conv/b/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/conv3/conv/b/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/conv3/conv/b/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Initializer/zeros/shape_as_tensor"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\014\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Initializer/zeros/Const"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Initializer/zeros"
  op: "Fill"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Initializer/zeros/shape_as_tensor"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Initializer/zeros/Const"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/fc1/fc/kernel/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Momentum/Initializer/zeros"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
          dim {
            size: 2
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Momentum"
  op: "VariableV2"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
        dim {
          size: 2
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Momentum/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/fc2/kernel/Momentum"
  input: "40X_64S_model/inference/fc2/kernel/Momentum/Initializer/zeros"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "40X_64S_model/inference/fc2/kernel/Momentum/read"
  op: "Identity"
  input: "40X_64S_model/inference/fc2/kernel/Momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
}
node {
  name: "Momentum/momentum"
  op: "Const"
  device: "/device:GPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/conv1/conv/W/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/conv1/conv/W"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/conv1/conv/Conv2D_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/conv1/conv/b/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/conv1/conv/b"
  input: "40X_64S_model/inference/conv1/conv/b/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/conv1/conv/BiasAdd_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/conv2/conv/W/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/conv2/conv/W"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/conv2/conv/Conv2D_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/conv2/conv/b/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/conv2/conv/b"
  input: "40X_64S_model/inference/conv2/conv/b/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/conv2/conv/BiasAdd_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/conv3/conv/W/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/conv3/conv/W"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/conv3/conv/Conv2D_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/conv3/conv/b/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/conv3/conv/b"
  input: "40X_64S_model/inference/conv3/conv/b/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/conv3/conv/BiasAdd_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/fc1/fc/kernel/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/fc1/fc/kernel"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/fc1/fc/MatMul_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update_40X_64S_model/inference/fc2/kernel/ApplyMomentum"
  op: "ApplyMomentum"
  input: "40X_64S_model/inference/fc2/kernel"
  input: "40X_64S_model/inference/fc2/kernel/Momentum"
  input: "ExponentialDecay"
  input: "gradients/40X_64S_model/inference/fc2/MatMul_grad/tuple/control_dependency_1"
  input: "Momentum/momentum"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Momentum/update"
  op: "NoOp"
  input: "^Momentum/update_40X_64S_model/inference/conv1/conv/W/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/conv1/conv/b/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/conv2/conv/W/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/conv2/conv/b/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/conv3/conv/W/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/conv3/conv/b/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/fc1/fc/kernel/ApplyMomentum"
  input: "^Momentum/update_40X_64S_model/inference/fc2/kernel/ApplyMomentum"
  device: "/device:GPU:0"
}
node {
  name: "Momentum/value"
  op: "Const"
  input: "^Momentum/update"
  device: "/device:GPU:0"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Momentum"
  op: "AssignAdd"
  input: "Variable"
  input: "Momentum/value"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 17
          }
        }
        string_val: "40X_64S_model/inference/conv1/conv/W"
        string_val: "40X_64S_model/inference/conv1/conv/W/Momentum"
        string_val: "40X_64S_model/inference/conv1/conv/b"
        string_val: "40X_64S_model/inference/conv1/conv/b/Momentum"
        string_val: "40X_64S_model/inference/conv2/conv/W"
        string_val: "40X_64S_model/inference/conv2/conv/W/Momentum"
        string_val: "40X_64S_model/inference/conv2/conv/b"
        string_val: "40X_64S_model/inference/conv2/conv/b/Momentum"
        string_val: "40X_64S_model/inference/conv3/conv/W"
        string_val: "40X_64S_model/inference/conv3/conv/W/Momentum"
        string_val: "40X_64S_model/inference/conv3/conv/b"
        string_val: "40X_64S_model/inference/conv3/conv/b/Momentum"
        string_val: "40X_64S_model/inference/fc1/fc/kernel"
        string_val: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
        string_val: "40X_64S_model/inference/fc2/kernel"
        string_val: "40X_64S_model/inference/fc2/kernel/Momentum"
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 17
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "40X_64S_model/inference/conv1/conv/W"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum"
  input: "40X_64S_model/inference/conv1/conv/b"
  input: "40X_64S_model/inference/conv1/conv/b/Momentum"
  input: "40X_64S_model/inference/conv2/conv/W"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum"
  input: "40X_64S_model/inference/conv2/conv/b"
  input: "40X_64S_model/inference/conv2/conv/b/Momentum"
  input: "40X_64S_model/inference/conv3/conv/W"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum"
  input: "40X_64S_model/inference/conv3/conv/b"
  input: "40X_64S_model/inference/conv3/conv/b/Momentum"
  input: "40X_64S_model/inference/fc1/fc/kernel"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
  input: "40X_64S_model/inference/fc2/kernel"
  input: "40X_64S_model/inference/fc2/kernel/Momentum"
  input: "Variable"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 17
          }
        }
        string_val: "40X_64S_model/inference/conv1/conv/W"
        string_val: "40X_64S_model/inference/conv1/conv/W/Momentum"
        string_val: "40X_64S_model/inference/conv1/conv/b"
        string_val: "40X_64S_model/inference/conv1/conv/b/Momentum"
        string_val: "40X_64S_model/inference/conv2/conv/W"
        string_val: "40X_64S_model/inference/conv2/conv/W/Momentum"
        string_val: "40X_64S_model/inference/conv2/conv/b"
        string_val: "40X_64S_model/inference/conv2/conv/b/Momentum"
        string_val: "40X_64S_model/inference/conv3/conv/W"
        string_val: "40X_64S_model/inference/conv3/conv/W/Momentum"
        string_val: "40X_64S_model/inference/conv3/conv/b"
        string_val: "40X_64S_model/inference/conv3/conv/b/Momentum"
        string_val: "40X_64S_model/inference/fc1/fc/kernel"
        string_val: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
        string_val: "40X_64S_model/inference/fc2/kernel"
        string_val: "40X_64S_model/inference/fc2/kernel/Momentum"
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 17
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_INT32
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/W"
  input: "save/RestoreV2"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/W/Momentum"
  input: "save/RestoreV2:1"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/b"
  input: "save/RestoreV2:2"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "40X_64S_model/inference/conv1/conv/b/Momentum"
  input: "save/RestoreV2:3"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv1/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/W"
  input: "save/RestoreV2:4"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/W/Momentum"
  input: "save/RestoreV2:5"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/b"
  input: "save/RestoreV2:6"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "40X_64S_model/inference/conv2/conv/b/Momentum"
  input: "save/RestoreV2:7"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv2/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/W"
  input: "save/RestoreV2:8"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/W/Momentum"
  input: "save/RestoreV2:9"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/W"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/b"
  input: "save/RestoreV2:10"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "40X_64S_model/inference/conv3/conv/b/Momentum"
  input: "save/RestoreV2:11"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/conv3/conv/b"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "40X_64S_model/inference/fc1/fc/kernel"
  input: "save/RestoreV2:12"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "40X_64S_model/inference/fc1/fc/kernel/Momentum"
  input: "save/RestoreV2:13"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc1/fc/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "40X_64S_model/inference/fc2/kernel"
  input: "save/RestoreV2:14"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "40X_64S_model/inference/fc2/kernel/Momentum"
  input: "save/RestoreV2:15"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@40X_64S_model/inference/fc2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "Variable"
  input: "save/RestoreV2:16"
  device: "/device:GPU:0"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  device: "/device:GPU:0"
}
node {
  name: "train_cost/tags"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "train_cost"
      }
    }
  }
}
node {
  name: "train_cost"
  op: "ScalarSummary"
  input: "train_cost/tags"
  input: "40X_64S_model/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "train_accuracy/tags"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "train_accuracy"
      }
    }
  }
}
node {
  name: "train_accuracy"
  op: "ScalarSummary"
  input: "train_accuracy/tags"
  input: "accuracy/update_op"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "learning_rate/tags"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "learning_rate"
      }
    }
  }
}
node {
  name: "learning_rate"
  op: "ScalarSummary"
  input: "learning_rate/tags"
  input: "ExponentialDecay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Merge/MergeSummary"
  op: "MergeSummary"
  input: "train_accuracy"
  input: "train_cost"
  input: "learning_rate"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
}
versions {
  producer: 27
}
