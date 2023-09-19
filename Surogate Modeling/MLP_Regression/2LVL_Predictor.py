import torch
import numpy as np
import torch.nn as nn
import torch.optim as optim
#from ray import tune
#from ray.tune import grid_search, uniform
from torch.utils.data import DataLoader, TensorDataset
import scipy.io
import os

class MLP(nn.Module):
  def __init__(self, input_size, output_size, dropout=0.0008, num_layers = 8, num_neurons = 2048):
        super(MLP, self).__init__()
        self.num_layers = num_layers
        self.layers = nn.ModuleList()
        self.bn_layers = nn.ModuleList()
        self.activation_fn = nn.ReLU()
        self.sigmoid = nn.Sigmoid()

        for i in range(num_layers):
          if i == 0:
            self.layers.append(nn.Linear(input_size, num_neurons))
            self.bn_layers.append(nn.BatchNorm1d(num_neurons))
          else:
            self.layers.append(nn.Linear(num_neurons // (2**(i-1)), num_neurons // (2**i)))
            self.bn_layers.append(nn.BatchNorm1d(num_neurons // (2**i)))

        # Try Relu also here after going through hyperparamter tuning
        self.output_layer = nn.Linear(num_neurons // (2**(num_layers-1)), output_size)
        self.dropout = nn.Dropout(dropout)

  def forward(self, x):
      for i in range(self.num_layers):
        x = self.layers[i](x)
        x = self.bn_layers[i](x)
        x = self.dropout(x)
        x = self.activation_fn(x)

      x = self.output_layer(x)
      x = self.sigmoid(x)
      return x

# Function to load the best model
def load_best_model(best_model_path, input_size, output_size):
    model = MLP(input_size, output_size)
    best_model = torch.load(best_model_path, map_location=torch.device('cpu'))
    model.load_state_dict(best_model)
    model.eval()
    return model

# Function to perform the inference using the loaded model
def perform_inference(model, input_tensor):
    with torch.no_grad():
        output_tensor = model(input_tensor)
    output_array = output_tensor.numpy()
    return output_array

# Function to scale back a single value
def scale_back_single(value, min_val, max_val):
    return value * (max_val - min_val) + min_val

# Function to scale back the entire array
def scale_back_array(output_array, min_vals, max_vals):
    scaled_back_array = np.empty_like(output_array)
    for i in range(output_array.shape[0]):
        scaled_back_array[i] = scale_back_single(output_array[i], min_vals[i], max_vals[i])
    return scaled_back_array

# Function to perform the complete inference process
def perform_complete_inference(best_model_path, input_row_scaled_py, input_size_py, output_size_py, min_output_py, max_output_py):
    # Load the best model
    model = load_best_model(best_model_path, input_size_py, output_size_py)

    # Convert input_row_scaled_py to a PyTorch tensor
    input_tensor = torch.tensor(input_row_scaled_py, dtype=torch.float)

    # Perform inference
    output_array = perform_inference(model, input_tensor)  # Use input_tensor here

    # Scale back the output_array
    #scaled_back_output = scale_back_array(output_array, min_output_py, max_output_py)

    return output_array
