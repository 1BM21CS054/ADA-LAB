#include <stdio.h>
#include <stdlib.h>

int a[10][10], visited[10], s[10], t=-1, n;

void topological(int node){
    int i;
    visited[node] = 1;
    for (i = 0; i < n; i++){
        if (a[node][i]==1 && visited[node]==0){
            topological(i);
        }
    }
    s[++t] = node;
}

int main (){

    int i,j;

    printf("Enter the number of nodes:\n");
    scanf("%d",&n);

    for (i=0; i<n; i++)
        s[i] = 0;

    printf("\nEnter graph in matrix form:\n");
    for (i=0; i<n; i++){
        for (j=0; j<n; j++){
            scanf("%d", &a[i][j]);
        }
    }
    for (i=0; i<n; i++){
        topological(i);
    }
    printf ("\nSorted graph:\n");
    for (i = 0; i<=t; i++){
        printf("%d ", s[i]);
    }

        return 0;
}
