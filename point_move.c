#include "maze.h"
#include<ctype.h>
#include<stdbool.h>

/**
 * @brief print the whole maze in the condition of the input is 'm'
 * @param row the height of maze
 * @param col the width of maze
 * @return no return
 */
void outputMap()
{
    // Output the maze to meet the requirement of input-'m'
    // printf("This is the maze:\n") and printf maze
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
    //map[curPoint.row][curPoint.col] = ' ';
    //map[nextPoint.row][nextPoint.col] = 'X';
}

/**
 * @brief after convertint op to lowercase letters, check the validation of op and update the information in the map
 * @param curPoint current point in maze
 * @param op the operation
 * @return the point in maze after moving
 */
struct node move(struct node curPoint, char op)
{   
    struct node nextPoint;
    // case insensitive
    op = tolower(op);
    // First determine whether the operator op is valid
    // if not, printf("This operation is not valid, Please input: w/s/a/d/m");
    // According to the operator to determine the next action
    // if op = 'm', invoke outputMap else update nextPoint and check the validation
    // if the nextPoint is a space, then invoke updateMap() and printf("move successfully")
    // else printf("oops! This step may have hit a snag. Please input: w/s/a/d/m")
    if(op == 'm' || op == 'w' || op == 'a' || op == 's' || op == 'd')
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
}