# PP_cw1 from yuk1, Yixiao Ding 2022115990
## **Skeleton Code**
- There are three modules. The three modules are responsible for detecting validity (input_integration), performing operations(point_move), and hiding eggs(hidden_part)
- In the program, the thought design uses the ```//``` identifier to comment and the code frameork uses the ```/* */``` identifier to comment.
- When you input the command line arguments and the file of instruction, the program will check their validity. If they are invalid, it will display the error information. Else, it will move on command.
- There is a **hidden egg**. The author is an enthusiast of acm. Therefore, if you can get the SHA256 secret key of author's nick and add this string to the beginning of the instruction, the author will give you a file including shortest path instructions to get out of the maze.

## **Test Script**
outline:
- The command line parameter is invalid
    1. The number of input parameters is too large or too small
    2. The file name does not contain data+operationfile
    3. The file format is incorrect
    4. The length and width are not integers
    5. Illegal length and width (positive and negative numbers, letters)
- Map file is not legal
    1. The E spot is incomplete
    2. An invalid symbol exists
    3. The length and width information do not match too much (considering the maximum value) or too little
- Map boundary condition detection
    1. The destination cannot be reached
    2. The boundary is 5 in length and 5 in width
    3. When the length and width of the boundary are 100
    4. Make it to the finish line
- Operation instruction detection
    - (Illegal detection)
    1. The input command is empty
    2. Move to the wall
    3. Move to the border
    4. Press non-ASDWM keys (including Spaces and newlines)

    - (Validity detection)
    1. Enter a string
    2. w
    3. s
    4. a
    5. d
    6. m
    7. You can continue playing after hitting a wall
    8. The input is case insensitive
    9. Timely update of X when repeated movement
    10. There are still operation inputs after reaching the end


- additional test:
    1. Hide cheat code: Generate quick pass Cheats + specified file inspection
    2. Generate empty files and compressed file as input detection

## **Test Data**
- The Data can be matched to the test script

## **makefile**
- Because of the skeleton code, no warning is displayed at compile time. There are non-return value and unused variable warnings.