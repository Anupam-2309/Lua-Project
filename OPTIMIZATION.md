# Bisection Method in LuaLaTeX

This repository contains a Lua implementation of the **Bisection Method** integrated with **LuaLaTeX** for solving nonlinear equations. The Bisection Method is a root-finding algorithm that iteratively narrows down an interval containing a root by halving the interval.

## Table of Contents
- [Features](#features)
- [How It Works](#how-it-works)
- [Usage](#usage)
- [Example](#example)


## Features
- A customizable Lua Bisection method that can solve different equations.
- Integration with LaTeX using **LuaLaTeX**, allowing computation and typesetting within the same document.
- Step-by-step output of the Bisection Method, including iteration data.

## How It Works
The Bisection Method works by repeatedly halving the interval `[a, b]` and checking if the midpoint contains the root. This process continues until the interval size is smaller than a given tolerance.

### Steps:
1. Define an equation `f(x)` in Lua.
2. Run the Bisection method to solve `f(x) = 0` for a given interval `[a, b]`.
3. The solution is found when the error between `a` and `b` becomes smaller than the tolerance.

## Usage

### Standalone Lua Script
You can use the provided Lua script as a standalone implementation to solve equations using the Bisection Method.

## Example
To solve the equation $f(x)=x^3−2x−5$ on the interval [2,3], run the following Lua script:
```lua
local equation = function(x)
    return x^3 - 2*x - 5
end

bisectionSolver = Bisection:new(2, 3, equation, 0.001)
bisectionSolver:solve()

```