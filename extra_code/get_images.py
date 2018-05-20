import os
import csv
from matplotlib import pyplot as plt


def get_images(regions):
    image_rows = dict()
    all_found = False

    image_list_dir = '/scratch/cluster/aish/VisualGenome/image_lists/'
    image_list_files = [os.path.join(image_list_dir, f) for f in os.listdir(image_list_dir)]

    for filename in image_list_files:
        with open(filename) as handle:
            reader = csv.reader(handle, delimiter=',')
            for row in reader:
                region = row[0]
                if region in regions:
                    image_rows[region] = row
                    if len(image_rows.keys()) == len(regions):
                        all_found = True
                        break
        if all_found:
            break
        print 'Processed file', filename

    target_image_dir = '/u/aish/Pictures/rl_for_oal/'

    for key, row in image_rows.items():
        image_path = row[1]
        image = plt.imread(image_path)

        [x, y, width, height] = [int(val) for val in row[2:]]

        # Some checks to handle bbox annotation errors
        x_min = max(x, 0)
        x_max = min(x + width, image.shape[1] - 1)
        y_min = max(y, 0)
        y_max = min(y + height, image.shape[0] - 1)
        if x_min + 1 >= x_max:
            x_min = 0
            x_max = image.shape[1] - 1
        if y_min + 1 >= y_max:
            y_min = 0
            y_max = image.shape[0] - 1

        # Need to crop one at a time to avoid broadcasting in numpy
        image = image[:, range(x_min, x_max), :]
        image = image[range(y_min, y_max), :, :]

        filename = target_image_dir + key + '.jpg'
        plt.imsave(filename, image)


if __name__ == '__main__':
    default_regions = ['3466050', '557595', '1709240', '2922551', '552043', '1405796', '566205', '573321', '984201',
                       '1727509','2986866', '2907779', '717300', '2901780', '624330', '929375', '3075138', '812101',
                       '626060', '2106147', '3256062', '4842225', '3322101', '215966']
    get_images(default_regions)