#include<stdio.h>

int n[10] = {2,4,1,5,3,8,9,7,6,0};

void swap(int *a, int *b){
    int temp = *a;
    *a = *b;
    *b = temp;
}
int bubbleSort(int *n, int len){
    int i,j,temp;
    for(i = 0;i < len;i++){
        for(j = 0; j < len-i-1; j++){
            if(n[j] > n[j+1]){
                printf("swap [%d<->%d]\n", n[j], n[j+1]);
                swap(&n[j], &n[j+1]);
            }
        }
        printf("after one sort:\n");
        for(int k =0; k < 10;k++)
            printf("%d\t", n[k]);
        printf("\n");
    }
}

int main(int argc,char* argv[]){
    int i;
    for(i = 0;i < 10;i++)
        printf("%d\t", n[i]);
    printf("\n");
    bubbleSort(n, 10);

    for(i = 0;i < 10;i++)
        printf("%d\t", n[i]);
    printf("\n");
    return 0;
}
