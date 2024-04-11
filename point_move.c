#include "maze.h"
#include<stdbool.h>
#include<stdio.h>

/**
 * @brief print the whole maze in the condition of the input is 'm'
 * @param curPoint current point in maze
 * @return no return
 */
void outputMap(struct node curPoint)
{
    // Output the maze to meet the requirement of input-'m'
    // printf("Maze is here (%d, %d):\n", curPoint.row, curPoint.col) and printf maze
}

/**
 * @brief Check whether the point in the maze is valid, which means it is a space
 * @param x the node-type variable
 * @return true or false
 */
bool checkLocation(struct node x)
{
    // Check whether the current direction of movement is legal
    // Whether the curPoint is a border or a wall
}

/**
 * @brief update the information of current point in the maze, using 'X' to represent it
 * @param curPoint the current location of point
 * @param nextPoint the latter location of point
 * @return no return
 */
void updateMap(struct node curPoint, struct node nextPoint)
{
    // Update the information of current point in the maze
    /*
    map[curPoint.row][curPoint.col] = ' ';
    map[nextPoint.row][nextPoint.col] = 'X';
    */
}

/**
 * @brief  update the information in the map
 * @param curPoint current point in maze
 * @param cmd the operation
 * @return the point in maze after moving
 */
struct node move(struct node curPoint, char cmd)
{   
    /*
    struct node nextPoint;
    */
   
    // According to the operator to determine the next action
    // if op = 'm', invoke outputMap() else update nextPoint and check the validation
    // if the nextPoint is a space, then invoke updateMap() and printf("move successfully")
    // else printf("oops! This step may have hit a snag. Please input: w/s/a/d/m")
    /*
    if(cmd == 'm' || cmd == 'w' || cmd == 'a' || cmd == 's' || cmd == 'd')
    {
        if(checkLocation(nextPoint)){
            updateMap(curPoint, nextPoint);
            printf("move successfully\n");
        }
        else {
            printf("oops! This step may have hit a snag. Please input: w/s/a/d/m");
        }
    }
    else {
        printf("This operation is not valid, Please input: w/s/a/d/m");
    }

    return nextPoint;
    */
}