# Overview
This repository focuses on exploring and implementing various Multi-Layer Perceptron (MLP) regression models for predicting different output patterns of electric car converters. 
These models play a crucial role in a Multi-Objective Optimization (MOO) problem, where we aim to optimize efficiency, cost, and power output simultaneously. 
The primary goal is to construct a Pareto front that represents the trade-off between these objectives.

# Contents
This repository contains the following components:

1. Model Implementations:
   
Different MLP regression models have been implemented to predict the output patterns of electric car converters. 
These models take into account the design parameters and material properties to make accurate predictions.

2. Data Generation:
   
To ensure a diverse and comprehensive dataset, synthetic data is generated using Generative Adversarial Networks (GANs) and Variational Autoencoders (VAEs). 
This approach ensures a higher quantity of data points for training and evaluation.

# Objective Variables:

The output variables of interest are efficiency, cost, and power. 
These are critical metrics in the context of electric car converters and are central to the multi-objective optimization process.

# Evaluation:

The models will be rigorously evaluated using various techniques:

- Hyperparameter tuning through grid search and Bayesian optimization to find optimal configurations.
- Cross-validation to assess generalization performance.
- Visualization of regression lines to understand model behavior.
