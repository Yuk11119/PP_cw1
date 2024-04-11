#!/bin/bash
chmod + maze.c

basic_function() {
    echo -n "$1"

    eval "$2" > tmp

    if grep -q "$3" tmp; then
        echo -e "\e[32m PASS \e[0m"
    else
        echo -e "\e[31m FAIL \e[0m"
    fi

    rm -f tmp
}

check_map() {
    map=$(<"$1")

    map=${map//S/X}

    expected=$(<"$2")

    if [ "$map" = "$expected" ]; then
        return 1
    else
        return 0
    fi
}


echo -n "\n\e[33mThe validity of command line arguments\e[0m\n"

basic_function\
    "\nTest 1: Test the overmuch number of command line arguments\n"\
    "./maze TestData/invalid_argu.txt 10 10 10"\
    "ERROR: The number of command line arguments is not correct"

basic_function\
    "Test 2: Test the too little number of command line arguments\n"\
    "./maze TestData/invalid_argu.txt 10"\
    "ERROR: The number of command line arguments is not correct"

basic_function\
    "Test 3: Lack of filename of maze\n"\
    "./maze 10 10"\
    "ERROR: The number of command line arguments is not correct"

basic_function\
    "Test 4: The file is not exist\n"\
    "./maze TestData/None.txt 10 10"\
    "ERROR: The file is not exist"

basic_function\
    "Test 5: Uncorrect data type\n"\
    "./maze TestData/data.csv 10 10"\
    "ERROR: The data type is invalid"

basic_function\
    "Test 6: Test the invalid data type (1)\n"\
    "./maze TestData/invalid_argu.txt 10.0 10"\
    "ERROR: The arguments of width and height are not valid"

basic_function\
    "Test 7: Test the invalid data type (2)\n"\
    "./maze TestData/invalid_argu.txt 10 a~"\
    "ERROR: The arguments of width and height are not valid"

basic_function\
    "Test 8: Test the invalid data range (1)\n"\
    "./maze TestData/invalid_argu.txt 10 3"\
    "ERROR: The arguments of width and height are not valid"

basic_function\
    "Test 9: Test the invalid data range (2)\n"\
    "./maze TestData/invalid_argu.txt 110 10"\
    "ERROR: The arguments of width and height are not valid"

basic_function\
    "Test 10: Test the invalid data range (3)\n"\
    "./maze TestData/invalid_argu.txt -25 10"\
    "ERROR: The arguments of width and height are not valid"

basic_function\
    "Test 11: Test the invalid data range (4)\n"\
    "./maze TestData/invalid_argu.txt 10 0"\
    "ERROR: The arguments of width and height are not valid"

echo -n "\n\e[33mMaze file validity detection\e[0m\n"

basic_function\
    "\nTest 12: Test missing point of S or E (1)\n"\
    "./maze TestData/lack_SE_1.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 13: Test missing point of S or E (2)\n"\
    "./maze TestData/lack_SE_2.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 14: Test repeated point of S or E\n"\
    "./maze TestData/re_SE.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 15: The invalid symbol in the maze\n"\
    "./maze TestData/invalid_symbol.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 16: The length and width information do not match (less in row)\n"\
    "./maze TestData/lessrow.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 17: The length and width information do not match (less in col)\n"\
    "./maze TestData/lesscol.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 18: The length and width information do not match (more in col)\n"\
    "./maze TestData/morecol.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 19: The length and width information do not match (more in row)\n"\
    "./maze TestData/morerow.txt 10 10"\
    "ERROR: The map is not valid"

basic_function\
    "Test 20: The length and width information do not match (much more)\n"\
    "./maze TestData/m_m.txt 10 10"\
    "ERROR: The map is not valid"

echo -n "\n\e[33mMaze boundary condition detection\e[0m\n"

basic_function\
    "\nTest 21: Unreachable end point\n"\
    "./maze TestData/unre_e.txt 20 20"\
    "WARNING: This game cannot be won"

basic_function\
    "Test 22: A maze with a minimum length and width\n"\
    "./maze TestData/legal_minm.txt 5 5 < Input/std_operation.txt"\
    "move successfully"

basic_function\
    "Test 23: A maze with a maxmum length and width\n"\
    "./maze TestData/legal_maxm.txt 100 100 < Input/std_operation.txt"\
    "move successfully"

basic_function\
    "Test 24: Reach the end point\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution.txt"\
    "Winner Winner, Chicken dinner!"

echo -n "\n\e[33mOperation instruction detection\e[0m\n"
echo -n "   invalid detection:\n"

basic_function\
    "\nTest 25: Empty operation instruction\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/empty.txt"\
    "WARNING: The operation instruction is empty! Please change it"

basic_function\
    "Test 26: The operation instruction is not exist\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/None.txt"\
    "WARNING: The operation instruction is not exist! Please change it"

basic_function\
    "Test 27: Encountered a wall while moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/wall.txt"\
    "oops! This step may have hit a snag. Please input: w/s/a/d/m"

basic_function\
    "Test 28: Encountered a boundary while moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/boundary.txt"\
    "oops! This step may have hit a snag. Please input: w/s/a/d/m"

basic_function\
    "Test 29: Invalid operation instruction (1)\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/invalid_op_p.txt"\
    "This operation is not valid, Please input: w/s/a/d/m"

basic_function\
    "Test 30: Invalid operation instruction (2)\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/invalid_op_n.txt"\
    "This operation is not valid, Please input: w/s/a/d/m"

basic_function\
    "Test 31: Invalid operation instruction (3)\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/invalid_op_o.txt"\
    "This operation is not valid, Please input: w/s/a/d/m"

echo -n "\n\e[33mOperation instruction detection\e[0m\n"
echo -n "   valid detection:\n"

basic_function\
    "Test 32: String operation instruction\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_string.txt"\
    "Winner Winner, Chicken dinner!"

echo -n "Test 33: Normal input of w/a/s/d\n"
./maze TestData/std_maze.txt 25 25 < Input/std_operation.txt > tmp
cnt=$(grep -o "move successfully" tmp | wc -l)
if [ $cnt -eq 8 ] && check_map "TestData/std_maze.txt" "$tmp" == 1;
then
    echo -e "\e[32m PASS \e[0m"
else
    echo -e "\e[31m FAIL \e[0m"
fi
rm -f tmp

basic_function\
    "Test 34: Check operation instructions are case insensitive\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_Aa.txt"\
    "Winner Winner, Chicken dinner!"

basic_function\
    "Test 35: Continuity of game\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_bad.txt"\
    "Winner Winner, Chicken dinner!"

basic_function\
    "Test 36: Check the maze before moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/m.txt"\
    "maze is here (12, 10):"

basic_function\
    "Test 37: Check the maze after moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/moving_m.txt"\
    "maze is here (14, 9):"

basic_function\
    "Test 38: Overmuch operational inputs after reaching the end point\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_more.txt"\
    "Winner Winner, Chicken dinner!"

echo -n "Test 39: Too little operational inputs before reaching the end point\n"
./maze TestData/std_maze.txt 25 25 < Input/std_solution_less.txt > tmp
last_line=$(tail -n 1 tmp)
last_line_std="Please input your next operation in w/s/a/d/m: "
if [ "$last_line" = "$last_line_std" ];
then
    echo -e "\e[32m PASS \e[0m"
else
    echo -e "\e[31m FAIL \e[0m"
fi
rm -f tmp