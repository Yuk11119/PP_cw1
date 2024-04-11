#include"maze.h"
#include<stdbool.h>
#include<stdio.h>
#include<string.h>

// As the maxmum of width and height is 100, the maxmum number of elements is 10000
const int MAX_NUM = 10000;

/**
 * @brief This function can check whether the E point is reachable depending on breadth-first search algorithm
 * @param empty as the array - map is a global variable
 * @return if the E point is reachable, return true
 */
bool bfsCheck()
{

    // Simulated queue
    int q[MAX_NUM], tt = 0, hh = -1;
    // Record each node is reachable or not
    bool st[105][105];
    memset(st, 0, sizeof(st));

    // during bfs
    if(st[e.row][e.col] == true) return true;
    
    return false;
}

/**
 * @brief This is a hidden part just like a cheat code
 *        If the first line of operation instructions is same with std_key, then this function will automatically generate a shortest path operation file for the current maze
 *        std_key: a SHA256 secret key of the author name - yuk1, you can write a program to get it
 * @param empty as the array - map is a global variable
 * @return if the E point is reachable, return true
 */
void cheat_code()
{
    // The secret key is "830507265eed04b17ae82cbb335d9a863abdb28d252b945d08e50f3532ba8c70"
    // Record the precursor of each node, reverse order output is the shortest path
    printf("hey, you are a genius\n");
    int pre[MAX_NUM];
    // Depending on the precursor, the operation insruction can be obtained and write to file
    FILE *file = fopen("congratulation.txt", "w");
    // ...
    fclose(file);
}