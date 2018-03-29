import json

target_regions = ['215966', '552043', '573321', '1709240', '2285537']
descriptions = dict()

region_descriptions_file = '/scratch/cluster/aish/VisualGenome/region_descriptions.json'

with open(region_descriptions_file) as handle:
    region_descriptions = json.loads(handle.read())
print 'Loaded region descriptions'

all_regions_found = False
num_images_processed = 0

for image in region_descriptions:
    regions = image['regions']
    for region in regions:
        region_id = str(region['region_id'])
        if region_id in target_regions:
            descriptions[region_id] = region['phrase']
            if len(descriptions.keys()) == len(target_regions):
                all_regions_found = True
                break
    if all_regions_found:
        break
    num_images_processed += 1
    if num_images_processed % 1000 == 0:
        print num_images_processed, 'images processed'

for region, description in descriptions.items():
    print region, ':', description

