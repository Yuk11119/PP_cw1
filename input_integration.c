#include<stdbool.h>
#include "maze.h"
#include<stdlib.h>

/**
 * @brief This is a function that check the validity of command line argument
 *        including the number of arguments, the format of the file and whether it exists and the type of data
 * @param num the command line argument-argc, type int
 * @param commandArgument[] the point of command line argument-argv
 * @return If the arguments are invalid, return false after printing the error information
 */
bool checkArgumentValidation(int num, char *commandArgument[])
{
    // Check the number of command line argument
    // If the length of argv[] is not 4, printf("ERROR: The number of command line arguments is not correct\n"), printf("the format like: ./maze data.txt width height\n")

    // Check the width and height of command line argument
    // They should be integers ranging from 5 to 100
    // if not, printf("ERROR: The arguments of width and height are not valid\n"), printf("Please enter an integer ranging from 5 to 100\n")


    // Check the existence of filename
    // if not, printf("ERROR: The file is not exist\n");


    // Check whether the format of file is .txt
    // if not, printf("ERROR: The data type is invalid\n The correct one is a txt file\n")
}

/**
 * @brief The contents of the file are read according to the filename and stored in the map two-dimensional character array
 *        meanwhile, update the information of variable s and e and the map display
 * @param row the height of maze
 * @param col the width of maze
 * @param fileName the point of maze file
 * @return no return as the array map is a global variable
 */
void readFile(int rows, int cols, char *fileName)
{
    // malloc the point - map

    // The contents of the file are read by line
    // and stored in the map array
    
    // Find the point of S and E to assign the value to variables s and e
    // and replace S by X in map
}

/**
 * @brief This function checks the validity of the content of maze, including
 *        the number of S and E points, the invalid symbol and whether the data information match to the maze
 *        if pass all check, then readfile automatically
 * @param row the height of maze
 * @param col the width of maze
 * @param fileName the point of maze file
 * @return If the maze is invalid, return false after printing the error information
 */
bool checkValidationMap(int row, int col, char *fileName)
{
    // Check that there is and only one point S and one point E
    // Check whether the length and width correspond to the contents of the file
    // Check whether each symbol is valid
    // if anyone not, printf("ERROR: The map is not valid") and return false;
    // else, readfile
    readFile(row, col, fileName);
}

/**
 * @brief This is a integrated validity check including command line arguments check and file validity check
 * @param num the command line argument-argc, type int
 * @param cla[] the point of command line argument-argv
 * @return after print the error information, return true or false
 */
bool check_tot(int num, char *cla[])
{
    if(!checkArgumentValidation(num, cla)) return false;
    width = atoi(cla[2]);
    height = atoi(cla[3]);
    if(!checkValidationMap(height, width, cla[1])) return false;
    return true;
}