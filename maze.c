#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

struct node{
    int row, col;
}s, e;
char **map;
/**
 * @brief
 * @param
 * @param
 * @return
 */

/**
 * @brief This is a function that check the validation of command line argument
 *        including the number of arguments, the format of the file and whether it exists and the type of data
 * @param num the command line argument-argc, type int
 * @param commandArgument the point of command line argument-argv
 * @return If the arguments are invalid, return false after printing the error information
 */
bool checkArgumentValidation(int num, char *commandArgument[])
{
    /*
    // Check the number of command line argument
    // If the length of argv[] is not 4, they are not valid and return false
    if(num != 4) {
        printf("ERROR: The number of command line arguments is not correct\n");
        return false;
    }

    // Check the width and height of command line argument
    // They should be integers ranging from 5 to 100
    if(strlen(commandArgument[2]) > 3 || strlen(commandArgument[3]) > 3) {
        printf("ERROR: The arguments of width and height are not valid\n");
        return false;
    }
    
    int width = atoi(commandArgument[2]);
    int height = atoi(commandArgument[3]);
    
    if(width < 5 || width > 100 || height < 5 || height > 100) {
        printf("ERROR: The arguments of width and height are not valid\n");
        return false;
    }

    // Check the validation of filename
    FILE *file = fopen(commandArgument[1], "r");
    if (file == NULL) {
        printf("ERROR: The file is not exist\n");
        return false;
    }
    // Check whether the format of file is .txt
    // if not, printf("ERROR: The data type is invalid")
    
    fclose(file);
    
    return true;*/
}

/**
 * @brief This function checks the validation of the content of maze, including
 *        the number of S and E points, the invalid symbol and whether the data information match to the maze
 * @param row the height of maze
 * @param col the width of maze
 * @param fileName the point of maze file
 * @return If the maze is invalid, return false after printing the error information
 */
bool checkValidationMap(int row, int col, char *fileName)
{
    /*
    bool flag = true;
    FILE *file = fopen(fileName, "r");
    // Check that there is and only one point S and one point E
    // Check whether the length and width correspond to the contents of the file
    // Check whether each symbol is valid
    // if anyone not, printf("ERROR: The map is not valid")
    // If all the tests, then run the function of readFile
    fclose(file);
    return true;*/
}

/**
 * @brief The contents of the file are read according to the filename and stored in the map two-dimensional character array
 *        meanwhile, update the information of variable s and e and the map display
 * @param row the height of maze
 * @param col the width of maze
 * @param fileName the point of maze file
 * @return no return as the array map is a global variable
 */
char** readFile(int rows, int cols, char *fileName) {
    /*
    map = (char**)malloc(rows * sizeof(char*));
    for (int i = 0; i < rows; i++) {
        map[i] = (char*)malloc(cols * sizeof(char));
    }

    // The contents of the file are read by line
    // and stored in the map array
    FILE *file = fopen(fileName, "r");
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < cols; j++) {
            char c = fgetc(file);
            map[i][j] = c;
            if(map[i][j] == 'S') {
                s.col = j;
                s.row = i;
                map[i][j] = 'X';
            }
            if(map[i][j] == 'E') {
                e.col = j;
                e.row = i;
            }
        }
        fgetc(file);
    }
    fclose(file);
    return map;
    */
}

/**
 * @brief This is a simple function that achieve comparison between two structnode-type variable
 * @param a one variable
 * @param b the other variable
 * @return if these two variables are same, return true
 */
bool nodecmp(const struct node a, const struct node b)
{
    if(a.col != b.col || a.row != b.row) return false;
    else return true;
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
    map[curPoint.row][curPoint.col] = ' ';
    map[nextPoint.row][nextPoint.col] = 'X';
}

int main(int argc, char *argv[])
{
    /*
    struct node curPoint, nextPoint;
    char op;

    // Check the validation of command line arguments
    if(!checkArgumentValidation(argc, argv)) return 0;

    int width = atoi(argv[2]);
    int height = atoi(argv[3]);

    // Check the validation of file
    if(!checkValidationMap(height, width, argv[1])) {
        printf("ERROR: The map is not valid\n");
        return 0;
    }

    // start game
    curPoint.row = s.row;
    curPoint.col = s.col;
    while(!nodecmp(curPoint, e))
    {
        printf("Please input your operation: ");
        scanf("%c", &op);
        op = tolower(op);
        nextPoint.row = curPoint.row;
        nextPoint.col = curPoint.col;

        // Check the input validation
        if(op == 'm') outputMap(height, width);
        else if(op == 'w' || op == 'a' || op == 's' || op == 'd') {
            if(op == 'w') nextPoint.row--;
            else if(op == 'a') nextPoint.col--;
            else if(op == 's') nextPoint.row++;
            else nextPoint.col++;

            if(checkLocation(nextPoint)){
                updateMap(curPoint, nextPoint);
            }
            else {
                printf("oops! This step may have hit a snag.");
                printf("Please try again\n");
            }
        }
        else {
            printf("The operation is not valid, Please change it\n");
        }
    }
    
    // Output the flag of win
    if(nodecmp(curPoint, e)) {
        printf("Winner Winner, Chicken dinner!");
        printf(" -Yuk1 wish you happy every day\n");
    }

    for (int i = 0; i < width; i++) {
        free(map[i]);
    }
    free(map);
    return 0;
    */
}