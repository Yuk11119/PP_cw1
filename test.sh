#!/bin/bash
chmod +x maze

# Basic function, the input three parameters are "test title", "command line arguments", "judgment criteria"
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

# Compare the two maps, whether to remove the 'S' point and add the 'X' point
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

# Test the situation that there are five command line arguments including './maze'
basic_function\
    "\nTest 1: Test the overmuch number of command line arguments\n"\
    "./maze TestData/invalid_argu.txt 10 10 10"\
    "ERROR: The number of command line arguments is not correct"

# Test the situation that there are just three command line arguments
basic_function\
    "Test 2: Test the too little number of command line arguments\n"\
    "./maze TestData/invalid_argu.txt 10"\
    "ERROR: The number of command line arguments is not correct"

# Test a command line argument without file name input
basic_function\
    "Test 3: Lack of filename of maze\n"\
    "./maze 10 10"\
    "ERROR: The number of command line arguments is not correct"

# The file for testing the command line arguments input does not exist
basic_function\
    "Test 4: The file is not exist\n"\
    "./maze TestData/None.txt 10 10"\
    "ERROR: The file is not exist"

# The file format of the test command line argument is incorrect
basic_function\
    "Test 5: Uncorrect data type\n"\
    "./maze TestData/data.csv 10 10"\
    "ERROR: The data type is invalid"

# Test input data for double-type numbers
basic_function\
    "Test 6: Test the invalid data type (1)\n"\
    "./maze TestData/invalid_argu.txt 10.0 10"\
    "ERROR: The arguments of width and height are not valid"

# Test input data for char-type numbers
basic_function\
    "Test 7: Test the invalid data type (2)\n"\
    "./maze TestData/invalid_argu.txt 10 a~"\
    "ERROR: The arguments of width and height are not valid"

# Test input data is too small
basic_function\
    "Test 8: Test the invalid data range (1)\n"\
    "./maze TestData/invalid_argu.txt 10 3"\
    "ERROR: The arguments of width and height are not valid"

# Test input data is too large
basic_function\
    "Test 9: Test the invalid data range (2)\n"\
    "./maze TestData/invalid_argu.txt 110 10"\
    "ERROR: The arguments of width and height are not valid"

# Test input data is negative
basic_function\
    "Test 10: Test the invalid data range (3)\n"\
    "./maze TestData/invalid_argu.txt -25 10"\
    "ERROR: The arguments of width and height are not valid"

# Test input data is zero
basic_function\
    "Test 11: Test the invalid data range (4)\n"\
    "./maze TestData/invalid_argu.txt 10 0"\
    "ERROR: The arguments of width and height are not valid"

echo -n "\n\e[33mMaze file validity detection\e[0m\n"

# Test the maze missing the 'E' point
basic_function\
    "\nTest 12: Test missing point of S or E (1)\n"\
    "./maze TestData/lack_SE_1.txt 10 10"\
    "ERROR: The map is not valid"

# Test the maze missing the 'S' point
basic_function\
    "Test 13: Test missing point of S or E (2)\n"\
    "./maze TestData/lack_SE_2.txt 10 10"\
    "ERROR: The map is not valid"

# Test the maze has multiple 'S' or 'E' points
basic_function\
    "Test 14: Test repeated point of S or E\n"\
    "./maze TestData/re_SE.txt 10 10"\
    "ERROR: The map is not valid"

# Test the maze has other elements expcept ' ', '#', 'S', 'E'
basic_function\
    "Test 15: The invalid symbol in the maze\n"\
    "./maze TestData/invalid_symbol.txt 10 10"\
    "ERROR: The map is not valid"

# Test there are some rows where the number of elements is less than height
basic_function\
    "Test 16: The length and width information do not match (less in row)\n"\
    "./maze TestData/lessrow.txt 10 10"\
    "ERROR: The map is not valid"

# Test there are some columns where the number of elements is less than width
basic_function\
    "Test 17: The length and width information do not match (less in col)\n"\
    "./maze TestData/lesscol.txt 10 10"\
    "ERROR: The map is not valid"

# Test there are some rows where the number of elements is more than height
basic_function\
    "Test 18: The length and width information do not match (more in col)\n"\
    "./maze TestData/morecol.txt 10 10"\
    "ERROR: The map is not valid"

# Test there are some columns where the number of elements is more than width
basic_function\
    "Test 19: The length and width information do not match (more in row)\n"\
    "./maze TestData/morerow.txt 10 10"\
    "ERROR: The map is not valid"

# Test whether the array will overflow in the condition that the width is mucn larger than upper limit of range
basic_function\
    "Test 20: The length and width information do not match (much more)\n"\
    "./maze TestData/m_m.txt 10 10"\
    "ERROR: The map is not valid"

echo -n "\n\e[33mMaze boundary condition detection\e[0m\n"

# Test the 'E' point is not reachable
basic_function\
    "\nTest 21: Unreachable end point\n"\
    "./maze TestData/unre_e.txt 20 20"\
    "WARNING: This game cannot be won"

# Check the boundary case with the smallest length and width
basic_function\
    "Test 22: A maze with a minimum length and width\n"\
    "./maze TestData/legal_minm.txt 5 5 < Input/std_operation.txt"\
    "move successfully"

# Check the boundary case with the largest length and width
basic_function\
    "Test 23: A maze with a maxmum length and width\n"\
    "./maze TestData/legal_maxm.txt 100 100 < Input/std_operation.txt"\
    "move successfully"

# Check the situation of a successful arrival at the end
basic_function\
    "Test 24: Reach the end point\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution.txt"\
    "Winner Winner, Chicken dinner!"

echo -n "\n\e[33mOperation instruction detection\e[0m\n"
echo -n "   invalid detection:\n"

# Test the operation instruction file is empty
basic_function\
    "\nTest 25: Empty operation instruction\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/empty.txt"\
    "WARNING: The operation instruction is empty! Please change it"

# Test what will happen if encountering a wall while moving
basic_function\
    "Test 26: Encountered a wall while moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/wall.txt"\
    "oops! This step may have hit a snag. Please input: w/s/a/d/m"

# Test what will happen if encountering an edge while moving
basic_function\
    "Test 27: Encountered a boundary while moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/boundary.txt"\
    "oops! This step may have hit a snag. Please input: w/s/a/d/m"

# Test what will happen if the operation instruction containing the other char-type operation
basic_function\
    "Test 28: Invalid operation instruction (1)\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/invalid_op_p.txt"\
    "This operation is not valid, Please input: w/s/a/d/m"

# Test what will happen if the operation instruction containing a line break
basic_function\
    "Test 29: Invalid operation instruction (2)\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/invalid_op_n.txt"\
    "This operation is not valid, Please input: w/s/a/d/m"

# Test what will happen if the operation instruction containing a space
basic_function\
    "Test 30: Invalid operation instruction (3)\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/invalid_op_o.txt"\
    "This operation is not valid, Please input: w/s/a/d/m"

echo -n "\n\e[33mOperation instruction detection\e[0m\n"
echo -n "   valid detection:\n"

# Check whether the input string operator works properly
basic_function\
    "Test 31: String operation instruction\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_string.txt"\
    "Winner Winner, Chicken dinner!"

# Test all the valid operation depending on all the operation have a response
echo -n "Test 32: Normal input of w/a/s/d\n"
./maze TestData/std_maze.txt 25 25 < Input/std_operation.txt > tmp
cnt=$(grep -o "move successfully" tmp | wc -l)
if [ $cnt -eq 8 ] && check_map "TestData/std_maze.txt" "$tmp" == 1;
then
    echo -e "\e[32m PASS \e[0m"
else
    echo -e "\e[31m FAIL \e[0m"
fi
rm -f tmp

# Check whether the input case is affected
basic_function\
    "Test 33: Check operation instructions are case insensitive\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_Aa.txt"\
    "Winner Winner, Chicken dinner!"

# Check if you can continue playing after hitting a wall or boundary
basic_function\
    "Test 34: Continuity of game\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_bad.txt"\
    "Winner Winner, Chicken dinner!"

# Check if 'X' points are updated when starting the game
basic_function\
    "Test 35: Check the maze before moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/m.txt"\
    "maze is here (12, 10):"

# Check if 'X' points are updated after moving several times
basic_function\
    "Test 36: Check the maze after moving\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/moving_m.txt"\
    "maze is here (14, 9):"

# Check what will happen if there are sill operation after reaching the 'E' point
basic_function\
    "Test 37: Overmuch operational inputs after reaching the end point\n"\
    "./maze TestData/std_maze.txt 25 25 < Input/std_solution_more.txt"\
    "Winner Winner, Chicken dinner!"

# Check what will happen if instruction has ended before reaching the 'E' point
echo -n "Test 38: Too little operational inputs before reaching the end point\n"
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

echo -n "\n\e[31mAdditional Tests!\e[0m\n"

# Test what will happen if input a unknown file which is a tempory file
echo -n "Add-Test 1: Unknown file input\n"
data_tmp="dt.txt"
touch "$data_tmp"
./maze "$data_tmp" 10 10 > tmp
if grep -q "ERROR: The arguments of width and height are not valid" tmp;
then
    echo -e "\e[32m PASS \e[0m"
else
    echo -e "\e[31m FAIL \e[0m"
fi
rm -f tmp
rm -f "$data_tmp"

# Check what will happen if input a compressed file
echo -n "Add-Test 2: Compressed file input\n"
src="TestData/std_maze.txt"
output_file="datazip.tar.gz"
tar -czf "$output_file" "$src"
./maze "$output_file" 10 10 > tmp
if grep -q "ERROR: The data type is invalid" tmp;
then
    echo -e "\e[32m PASS \e[0m"
else
    echo -e "\e[31m FAIL \e[0m"
fi
rm "$output_file"
rm -f tmp

# Test the hidden part - cheat code
echo -n "Add_Test 3: Cheat code implementation\n"
src="Input/std_operation.txt"
cp_file="cheat_code.txt"
new_code="830507265eed04b17ae82cbb335d9a863abdb28d252b945d08e50f3532ba8c70"
printf "%s\n%s" "$new_code" "$(cat $src)" > "$cp_file"
./maze "$cp_file" 25 25 <cheat_code.txt > tmp
if grep -q "hey, you are a genius" tmp;
then
    echo -e "\e[32m PASS \e[0m"
else
    echo -e "\e[31m FAIL \e[0m"
fi
rm -f tmp
rm -f "$cp_file"