# Lua Programming Basics

Welcome to the **Lua Programming Basics** repository! This repository contains a comprehensive Lua script that covers the fundamental concepts of Lua programming. It's an excellent resource for beginners who are learning Lua or for anyone who needs a quick reference guide.

## Overview

This repository includes a single Lua script (`lua_basics.lua`) that demonstrates various key aspects of Lua programming, including:

1. **Variables and Data Types**: Learn how to work with numbers, strings, booleans, and `nil` in Lua.

2. **Arithmetic Operations**: Perform basic arithmetic operations such as addition, subtraction, multiplication, division, modulus, and exponentiation.

3. **Strings**: Explore basic string operations, including getting the length of a string, converting to uppercase or lowercase, and extracting substrings.

4. **Conditionals**: Use `if`, `elseif`, and `else` statements to control the flow of your Lua program based on different conditions.

5. **Loops**: Understand the different types of loops in Lua, including `for`, `while`, and `repeat-until`, and how to use them effectively.

6. **Functions**: Learn how to define and call functions in Lua to make your code modular and reusable.

7. **Tables**: Discover Lua's powerful table data structure, which can act as arrays, dictionaries (key-value pairs), or even multi-dimensional arrays like matrices.

## File Structure

- **`lua_basics.lua`**: This is the main script file that contains all the basic Lua codes with detailed comments explaining each section.

# Lua Matrix Operations

Welcome to the **`Matrix.lua`** file! This repository contains Lua code for creating and performing basic operations on matrices, such as addition, subtraction, multiplication, and transposition.

## Features

This file includes the following matrix operations:

1. **Matrix Creation**: Easily create a matrix with specified dimensions and values.
2. **Matrix Addition**: Add two matrices of the same size.
3. **Matrix Subtraction**: Subtract one matrix from another.
4. **Matrix Multiplication**: Multiply two matrices, where the number of columns in the first matrix equals the number of rows in the second matrix.
5. **Matrix Transposition**: Transpose a matrix, swapping its rows and columns.

## Code Overview

### 1. Creating a Matrix

The `createMatrix` function allows you to create a matrix with specified dimensions. You can also provide a list of values to initialize the matrix.

```lua
function createMatrix(n, m, values)
    local matrix = {}
    local valueIndex = 1

    for i = 1, n do
        matrix[i] = {}
        for j = 1, m do
            if values and values[valueIndex] then
                matrix[i][j] = values[valueIndex]
                valueIndex = valueIndex + 1
            else
                matrix[i][j] = 0
            end
        end
    end

    return matrix
end
```

## Getting Started

To run the script:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Anupam-2309/Lua-Project.git
   cd Lua-Programming-Basics

