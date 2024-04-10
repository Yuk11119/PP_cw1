#include<stdio.h>
#include<stdbool.h>
#include<string.h>
#include "point_move.h"
#include "input_integration.h"

struct node{
    int row, col;
}s, e;
char **map;
int width, height;

/**
 * @brief This is a simple function that achieve comparison between two structnode-type variable
 * @param a one variable
 * @param b the other variable
 * @return if these two variables are same, return true
 */
bool nodecmp(const struct node a, const struct node b)
{
}

int main(int argc, char *argv[])
{
    // flag represents whether reach to the E point
    struct node curPoint, nextPoint;
    bool flag = false;

    // invoke check_tot in input-integration.h to achieve modular check
    if(!check_tot(argc, argv))

    // start game
    curPoint.row = s.row;
    curPoint.col = s.col;
    char *op = malloc(100);
    // Read operation instructions in the file - op, each operation is represented by c
    // in the loop, update curPoint = move(curPoint, c);
    // then check if the E point has been reached
    if(nodecmp(curPoint, e)) {
        printf("Winner Winner, Chicken dinner!");
        flag = true;
    }

    // If haven't reached the e point when the instructions are exhausted
    // printf("Please input your next operation in w/s/a/d/m: ")

    for (int i = 0; i < width; i++) {
        free(map[i]);
    }
    free(map);
    return 0;
}