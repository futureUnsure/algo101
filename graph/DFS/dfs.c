#include "dfs.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void dfs_traversal(graph_obj_t *G, int root)
{
    //made a mistake of assigning content rather than address to source_node
    node_t *source_node = &(G->vertex_list[root]);
    node_t *member_node = source_node;
    if(G->visited[source_node->id] == false){
        printf("\n");
        printf("%d\n", source_node->id);
        G->visited[source_node->id] = true;
        while(1){
            member_node = member_node->next;
            if(member_node == NULL) return;
            if(G->visited[member_node->id] == true) return;
            int member_node_idx = G->node_index_map[member_node->id];
            dfs_traversal(G, member_node_idx);
        }

    }
      
    return;
}

static void strip_linefeed(char *stream)
{
    int len = strlen(stream);
    if(len > 0 && stream[len - 1] == '\n'){
        stream[len-1] = '\0';
    }
}

static void parse_stream(char *stream, graph_obj_t *G,
		const int current_id)
{
    //Gotta replace atoi's
    int source_node = atoi(strtok(stream, " "));
    G->vertex_list[current_id].id = source_node;
    G->node_index_map[G->vertex_list[current_id].id] = current_id;
    while(1){
        char *token = strtok(NULL, " ");
        if(token == NULL) break;
        int member_node = atoi(token);
        node_t *node_ptr = (node_t *)malloc(sizeof(node_t));
        node_ptr->id = member_node;
        if((G->vertex_list[current_id]).next == NULL){
            node_ptr->next = NULL;
            (G->vertex_list[current_id]).next = node_ptr;
        }
        else{
            node_ptr->next = (G->vertex_list[current_id]).next;
            (G->vertex_list[current_id]).next = node_ptr;          
        }
    }
}

static void read_in_nodes(graph_obj_t *G)
{
    //build a chain and link it to G->vertex_list[i].next
    static int current_node_id = 0;
    char *stream = malloc(sizeof(char) * 100);
    if (stream == NULL){
        printf("No memory!");
        exit(1);
    }
    
    
    fgets(stream, 1000, stdin);
    strip_linefeed(stream);
    parse_stream(stream,G,current_node_id);
    current_node_id++;
    free(stream);
}

static void init_graph(graph_obj_t *G)
{
    int vertex_iter;
    for (vertex_iter = 0; vertex_iter < 1000; vertex_iter++){
    	G->node_index_map[vertex_iter] = 0;
        G->visited[G->vertex_list[vertex_iter].id] = false;
        G->vertex_list[vertex_iter].next = NULL;
    }

}

static void invoke_input(graph_obj_t *G)
{
    //\n is bloody important!
    scanf("%d\n",&(G->no_of_nodes)); 
    init_graph(G);
    int i;
    for (i = 0; i < (G->no_of_nodes); i++){
        read_in_nodes(G);
    }
}



static void free_graph(graph_obj_t *G)
{
    int vertex_iter;
    for (vertex_iter = 0; vertex_iter < G->no_of_nodes; vertex_iter++){
        node_t *current = (G->vertex_list[vertex_iter]).next;
        while(current != NULL){
            node_t *next = current->next;
            free(current);
            current = next;
        }
    }
}

static void print_graph(const graph_obj_t *G)
{
    int vertex_iter;
    for (vertex_iter = 0; vertex_iter < G->no_of_nodes; vertex_iter++){
        node_t source_node = G->vertex_list[vertex_iter];
        printf("%d -> ", source_node.id);
        node_t *member_node =  source_node.next;
        while(member_node != NULL){
            printf("%d ",member_node->id);
            member_node = member_node->next;
        }
        printf("\n");
    }
    return;
}

int main()
{
    graph_obj_t G;
    invoke_input(&G);
    print_graph(&G);
    dfs_traversal(&G,0);
    free_graph(&G);
    return 0;
}
