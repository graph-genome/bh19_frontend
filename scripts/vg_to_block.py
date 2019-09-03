import json

with open('../exampleData/tiny.json', 'r') as f:
    graph_dict = json.load(f)

nodes = graph_dict['node']
graph_dict.pop('edge')
# edges = graph_dict['edge']
paths = graph_dict['path']
# print(nodes)
# print(edges)
# print(paths)

for node in nodes:
    seq_len = len(node['sequence'])
    node.pop('sequence')
    node['sequenceLength'] = seq_len

with open('../exampleData/x.blocks.json', 'w') as json_file:
  json.dump(graph_dict, json_file)