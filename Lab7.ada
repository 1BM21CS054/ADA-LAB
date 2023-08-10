kruskal c program
#include<stdio.h>
#include <stdbool.h>
#define INT_MAX 99
#define V 5
int n;
int parent[V];
int find(int i)
{
    while (parent[i] != i)
        i = parent[i];
    return i;
}

void union1(int i, int j)
{
    int a = find(i);
    int b = find(j);
    parent[a] = b;
}

void kruskalMST(int cost[][V])
{
    int mincost = 0;

    for (int i = 0; i < V; i++)
        parent[i] = i;

    int edge_count = 0;
    while (edge_count < V - 1) {
        int min = INT_MAX, a = -1, b = -1;
        for (int i = 0; i < V; i++) {
            for (int j = 0; j < V; j++) {
                if (find(i) != find(j) && cost[i][j] < min) {
                    min = cost[i][j];
                    a = i;
                    b = j;
                }
            }
        }

        union1(a, b);
        printf("Edge %d:(%d, %d) cost:%d \n",
               edge_count++, a, b, min);
        mincost += min;
    }
    printf("\n Minimum weight= %d \n", mincost);

}

int main()
{

    int cost[V][V];
    printf("Enter the number of nodes\n");
    scanf("%d",&n);
    printf("Enter the weight matrix\n");
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++)
            scanf("%d",&cost[i][j]);
    }

    kruskalMST(cost);

    return 0;
}

primes in c
#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#define V 10

int minKey(int key[], bool mstSet[], int n)
{
	int min = INT_MAX, min_index;

	for (int v = 0; v < n; v++)
		if (mstSet[v] == false && key[v] < min)
			min = key[v], min_index = v;

	return min_index;
}

int printMST(int parent[], int graph[V][V], int n)
{
    int weight = 0;
	printf("Edge \tWeight\n");
	for (int i = 1; i < n; i++)
		printf("%d - %d \t%d \n", parent[i], i,
			graph[i][parent[i]]);

    for(int i=1;i<n;i++){
        weight += graph[i][parent[i]];
    }
    printf("\nWeight is %d \n",weight);
}

void prims(int graph[V][V],int n)
{
	int parent[V];
	int key[V];
	bool mstSet[V];

	for (int i = 0; i < n; i++)
		key[i] = INT_MAX, mstSet[i] = false;

	key[0] = 0;

	parent[0] = -1;

	for (int count = 0; count < n - 1; count++) {

		int u = minKey(key, mstSet, n);

		mstSet[u] = true;

		for (int v = 0; v < n; v++)

			if (graph[u][v] && mstSet[v] == false
				&& graph[u][v] < key[v])
				parent[v] = u, key[v] = graph[u][v];
	}

	printMST(parent, graph, n);
}

int main()
{
    int graph[V][V],n;
    printf("Enter the number of nodes\n");
    scanf("%d",&n);
    printf("Enter the weight matrix\n");
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++)
            scanf("%d",&graph[i][j]);
    }

	prims(graph,n);
	return 0;
}

