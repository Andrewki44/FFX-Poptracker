import json
import random
import re
import glob
from pathlib import Path

def parse_location_node(poptracker_name_mapping, node: dict, curr_path) -> dict | tuple[dict, dict] | None:
    if "name" not in node:
        node["name"] = ""
    curr_path = node["name"] if curr_path is None else f"{curr_path}/{node['name']}"
    paths = {}
    has_data = False
    if "sections" in node:
        for child in node["sections"]:
            if "name" in child:
                if f'{node["name"]}/{child["name"]}' in poptracker_name_mapping:
                    mapping = poptracker_name_mapping[f'{node["name"]}/{child["name"]}']
                    paths[child["name"]] = mapping
                else:
                    paths[child["name"]] = child.get("ref", None)
        has_data = True
    if "children" in node:
        for child in node["children"]:
            result = parse_location_node(poptracker_name_mapping, child, curr_path)
            if result is not None:
                paths[child["name"]] = result
        has_data = True
    if has_data:
        return paths
    return None

def resolve_references(root: dict, node: dict):
    remaining_refs = False
    for name, child in node.items():
        if isinstance(child, str):
            ref_path = child.strip("/").split("/")
            try:
                ref = root
                for x in ref_path:
                    if isinstance(ref, tuple):
                        ref = ref[1]
                    ref = ref[x]
                if isinstance(ref, int):
                    node[name] = ref
                elif isinstance(ref, str):
                    remaining_refs = True
                    print(f"{ref_path} resolved to {ref}")
                    node[name] = ref
            except Exception as e:
                print(f"Failed to resolve {ref_path}: {e}")
        elif isinstance(child, dict):
            remaining_refs = remaining_refs or resolve_references(root, child)
    return remaining_refs

def flatten_locations(node, out_dict: dict, curr_path: str, prev_path: str):
    if isinstance(node, dict):
        for name, child in node.items():
            flatten_locations(child, out_dict, name, curr_path)
    elif isinstance(node, int):
        out_dict[f"{prev_path}/{curr_path}"] = node

def parse_locations(locations, mapping):
    paths = {}
    #random.shuffle(locations)
    for node in locations:
        print(node["name"])
        result = parse_location_node(mapping, node, None)
        paths[node["name"]] = result
    # Need to do two passes to resolve references
    remaining_refs = True
    while remaining_refs:
        print("Resolving")
        remaining_refs = False
        for name, node in paths.items():
            remaining_refs = remaining_refs or resolve_references(paths, node)

    out_dict = {}
    for name, node in paths.items():
        flatten_locations(node, out_dict, name, None)
    return out_dict


parent_dir = Path(__file__).resolve().parent.parent.parent.parent

# with open("../location_mapping.lua", "r") as f:
with open(parent_dir / "scripts/autotracking/location_mapping.lua", "r") as f:
    lines = f.readlines()

mapping = dict()
for i, line in enumerate(lines):
    match = re.search(r"\[([0-9]*)\] = {(.*)}", line)
    if match is not None:
        id = int(match.group(1))
        
        paths = match.group(2)
        paths = paths.split('", "')
        for p in paths:
            path = p.strip('/" ')
            if path.startswith("@"):
                match = re.search(r"[^/]*/[^/]*$", path[1:])
                if match is not None:
                    if match.group(0) in mapping:
                        print(f"Duplicate of {match.group(0)} with ids {mapping[match.group(0)]} and {id}")
                    mapping[match.group(0)] = id
                else:
                    pass
                    #print(path[1:])
                



locations = []
location_files = list(Path(parent_dir / "locations").rglob("*.json"))
# location_files = (Path(x) for x in list(parent_dir.rglob("locations/**")))
for path in location_files:
    if path.is_file() and path.suffix == ".json":
        with open(path, "r") as f:
            print(path)
            data = json.load(f)
            locations.extend(data)

final_mapping = parse_locations(locations, mapping)

with open(parent_dir / "scripts/autotracking/parser/ffx_locations.json", "w") as f:
    json.dump(final_mapping, f, indent=4)


with open(parent_dir / "maps/maps.json", "r") as f:
    data = json.load(f)

maps = {x["name"]: i for i, x in enumerate(data)}
with open(parent_dir / "scripts/autotracking/parser/ffx_map_index.json", "w") as f:
    json.dump(maps, f, indent=4)
