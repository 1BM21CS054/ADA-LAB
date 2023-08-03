#include <stdio.h>
#include <limits.h>

#define V 4

void floydWarshall(int graph[V][V]) {
    int dist[V][V];
    int i, j, k;

   
    for (i = 0; i < V; i++) {
        for (j = 0; j < V; j++) {
            dist[i][j] = graph[i][j];
        }
    }

  
    for (k = 0; k < V; k++) {
        for (i = 0; i < V; i++) {
            for (j = 0; j < V; j++) {
                if (dist[i][k] != INT_MAX && dist[k][j] != INT_MAX
                    && dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }
    printf("Shortest distances between all pairs of vertices:\n");
    for (i = 0; i < V; i++) {
        for (j = 0; j < V; j++) {
            if (dist[i][j] == INT_MAX)
                printf("%7s", "INF");
            else
                printf("%7d", dist[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int graph[V][V];
    printf("Enter the graph (enter 'INF' for infinity):\n");


    for (int i = 0; i < V; i++) {
        for (int j = 0; j < V; j++) {
            char input[10];
            scanf("%s", input);
            if (strcmp(input, "INF") == 0)
                graph[i][j] = INT_MAX;
            else
                graph[i][j] = (input);
        }
    }

    floydWarshall(graph);

    return 0;
}
