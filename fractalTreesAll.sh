#!/bin/bash

# Read the number of iterations
read N

# Initialize a 63x100 grid with underscores
# We use a 1D array to represent the 2D grid: index = row * 100 + col
declare -a grid
for ((i=0; i<63*100; i++)); do
    grid[$i]='_'
done

# Function to draw the Y-shape recursively
# Arguments: iteration, length, start_row, start_col
draw_tree() {
    local iter=$1
    local len=$2
    local r=$3
    local c=$4

    if [ $iter -gt $N ]; then
        return
    fi

    # 1. Draw the Vertical Trunk (going upwards from r)
    for ((i=0; i<len; i++)); do
        grid[ $(( (r-i)*100 + c )) ]='1'
    done

    # New base for branches is at (r - len)
    local branch_base_r=$(( r - len ))

    # 2. Draw the Slanting Branches (45 degrees)
    for ((i=1; i<=len; i++)); do
        grid[ $(( (branch_base_r-i)*100 + (c-i) )) ]='1' # Left branch
        grid[ $(( (branch_base_r-i)*100 + (c+i) )) ]='1' # Right branch
    done

    # 3. Recursive Call for next level
    # New length is half, new positions are the ends of the branches
    local next_len=$(( len / 2 ))
    draw_tree $((iter+1)) $next_len $((branch_base_r-len)) $((c-len))
    draw_tree $((iter+1)) $next_len $((branch_base_r-len)) $((c+len))
}

# Start drawing: Iteration 1, Length 16, Start at row 62, middle column 49
draw_tree 1 16 62 49

# Print the grid
for ((r=0; r<63; r++)); do
    line=""
    for ((c=0; c<100; c++)); do
        line="${line}${grid[$((r*100 + c))]}"
    done
    echo "$line"
done
