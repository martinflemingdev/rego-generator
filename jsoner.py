#!/usr/bin/python3

import yaml, json, sys

def yaml_to_json(yaml_path):
    with open(yaml_path, 'r') as yaml_file:
        data = yaml.safe_load(yaml_file)

    with open(yaml_path.replace('.yaml','.json'), 'w') as json_file:
        json.dump(data, json_file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script_name.py <path_to_yaml>")
        sys.exit(1)

    yaml_path = sys.argv[1]

    yaml_to_json(yaml_path)
