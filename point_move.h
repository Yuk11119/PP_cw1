#ifndef __POINT_MOVE_H__
#define __POINT_MOVE_H__

struct node {
    int row, col;
};

void move(int height, int width, char **map, struct node curPoint, char op);

#endif