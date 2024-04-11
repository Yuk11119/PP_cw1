#include<stdio.h>
#include<stdbool.h>
#include<string.h>
#include<stdlib.h>
#include "point_move.h"
#include "input_integration.h"
#include "hidden_part.h"

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
    return false;
}

int main(int argc, char *argv[])
{
    // flag represents whether reach to the E point
    struct node curPoint, nextPoint;
    bool flag = false;

    // invoke check_tot in input-integration.h to achieve modular check
    //if(!check_tot(argc, argv))

    // Check whether the E point is reachable
    // if not, printf("WARNING: This game cannot be won\n")
    if(!bfsCheck()) {
        printf("WARNING: This game cannot be won\n");
        return 0;
    }
    
    // start game
    //curPoint.row = s.row;
    //curPoint.col = s.col;

    // if the first line of operation instruction is same with std_key, invoke cheat_code()

    // using a array point with malloc to store the operation instructions
    // Read operation instructions in the file - op, each operation is represented by c

    // Check the vadility of the filename of operation instructions
    // if the file is not exist, printf("WARNING: The operation instruction is not exist! Please change it")
    // if the file is empty, printf("WARNING: The operation instruction is empty! Please change it")

    // in the loop, update curPoint = move(curPoint, c);
    // then check if the E point has been reached
    if(nodecmp(curPoint, e)) {
        printf("Winner Winner, Chicken dinner!");
        flag = true;
    }

    // If haven't reached the e point when the instructions are exhausted
    // printf("Please input your next operation in w/s/a/d/m: ")

    // Free the memory of a two-dimensional array
    return 0;
}