#ifndef __DFS_INCLUDED__
#define __DFS_INCLUDED__
#include <stdbool.h>
typedef struct node {
	int id;
	struct node *next;
} node_t;

typedef struct graph_obj{
    int no_of_nodes;
    node_t vertex_list[1000];
    bool visited[1000];
    int node_index_map[1000];
} graph_obj_t;
#endif

