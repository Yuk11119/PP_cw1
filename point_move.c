/**
 * @brief print the whole maze in the condition of the input is 'm'
 * @param row the height of maze
 * @param col the width of maze
 * @return no return
 */
void outputMap(int row, int col)
{
    // Output the maze to meet the requirement of input-'m'
    printf("This is the maze:\n");
    for(int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            printf("%c", map[i][j]);
        }
        printf("\n");
    }
}

void move(int height, int width, char **map, struct node curPoint, char op)
{
    struct node nextPoint;
    nextPoint.col = curPoint.col;
    nextPoint.row = curPoint.row;
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