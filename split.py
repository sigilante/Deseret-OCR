import os
from sklearn.model_selection import train_test_split
from shutil import copyfile

def split_data(input_folder, output_train_folder, output_test_folder, test_size=0.25, random_seed=42):
    # Create output folders if they don't exist
    if not os.path.exists(output_train_folder):
        os.makedirs(output_train_folder)
    if not os.path.exists(output_test_folder):
        os.makedirs(output_test_folder)

    # List all files in the input folder
    all_files = []
    for root, dirs, files in os.walk(input_folder):
        for file in files:
            file_path = os.path.join(root, file)
            all_files.append(file_path)

    # Split the data into training and test sets
    train_files, test_files = train_test_split(all_files, test_size=test_size, random_state=random_seed)

