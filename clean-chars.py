from PIL import Image
import os

def clean_and_standardize_image(input_path, output_path, target_size=(100, 100)):
    """
    Clean and standardize an image.

    Parameters:
    - input_path (str): Path to the input image.
    - output_path (str): Path to save the cleaned and standardized image.
    - target_size (tuple): Target size for the output image.

    Returns:
    - None
    """
    try:
        # Open the image file
        with Image.open(input_path) as img:
            # Convert to grayscale (if not already)
            img = img.convert("L")

            # Resize the image to the target size
            img = img.resize(target_size, Image.ANTIALIAS)

            # Save the cleaned and standardized image
            img.save(output_path)

    except Exception as e:
        print(f"Error processing image {input_path}: {str(e)}")

def batch_clean_and_standardize_images(input_folder, output_folder, target_size=(100, 100)):
    """
    Batch clean and standardize a folder of images.

    Parameters:
    - input_folder (str): Path to the folder containing input images.
    - output_folder (str): Path to save the cleaned and standardized images.
    - target_size (tuple): Target size for the output images.

    Returns:
    - None
    """
    # Create the output folder if it doesn't exist
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Iterate through each file in the input folder
    for filename in list_files_recursively(input_folder):
        input_path = filename #os.path.join(input_folder, filename)
        output_path = os.path.join(output_folder, filename)
        # Create the output folder if it doesn't exist
        if not os.path.exists(output_path[:output_path.rfind('/')]):
            os.makedirs(output_path[:output_path.rfind('/')])

        # Clean and standardize the image
        clean_and_standardize_image(input_path, output_path, target_size)

def list_files_recursively(directory):
    file_list = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_list.append(os.path.join(root, file))
    return file_list

if __name__ == "__main__":
    # Example usage:
    input_folder = "chars-sorted/"
    output_folder = "chars-cleaned/"
    target_size = (100, 100)

    # Clean and standardize a single image
    #clean_and_standardize_image("path/to/input/image.jpg", "path/to/output/cleaned_image.jpg", target_size)

    # Batch clean and standardize images in a folder
    batch_clean_and_standardize_images(input_folder, output_folder, target_size)

