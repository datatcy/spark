import numpy as np

data = [19,20,30,150,25,15,32]

def update_outliers(method):
    mean_data = np.mean(data)
    std_dev = np.std(data)
    upper_bound = mean_data + std_dev*2
    lower_bound = mean_data - std_dev*2
    for d in data:
        if (d < lower_bound) or (d > upper_bound):
            if method == 'mean':
                d = mean_data
            if method == 'remove':
                del d
