# Optimization Method in Lua

This repository contains a Lua implementation of the **Optimization Method** integrated with **Lua** for solving nonlinear equations.

## Table of Contents
- [Features](#features)
- [How It Works](#how-it-works)
- [Usage](#usage)
- [Example](#example)


## Features
- A customizable Lua optimization method that can solve different equations.
- Step-by-step output of the various optimization Method.

### Steps:
1. Define an equation `f(x)` in Lua.
2. Run any method to solve `f(x)` for a given interval `[a, b]`.
3. The solution is found when the error between `a` and `b` becomes smaller than the tolerance.

## Example

### Bisection Method

To solve the equation $f(x)=x^3−2x−5$ on the interval [2,3], run the following Lua script:
```lua
local equation = function(x)
    return x^3 - 2*x - 5
end

bisectionSolver = Bisection:new(2, 3, equation, 0.001)
bisectionSolver:solve()

```
### Golden Section Search Method

```lua
-- Function to be minimized f(x) = (x - 2)^2
function GoldenSectionSearch:f(x)
    return (x - 3) ^ 2
end

-- Instantiate and run Golden Section Search
goldenSectionSearch = GoldenSectionSearch:new(f,-5, 15, 10)
goldenSectionSearch:search()
```

### Fibonacci Search Method

```lua
local function f(x)
    return x^3 -2 *x -5
end

local search = Finbonacci_Search:new(f, 2, 3, 15)
search:solve()  
search:pretty_print() 

```

### Quadratic Interpolation Method

```lua
local function f(x)
    return x^3 - 2*x - 5  -- Example function to minimize
end

local search = Quadratic_Interpolation:new(f, 2, 3, 1e-3)
search:pretty_print()
```

### Equal Interval Search Method

```lua

-- Define the function
function f(x)
    return 1 - x * math.exp(-x^2) - 0.5
end

-- Set up the problem
a = 0.2
b = 1.8
e = 0.1

-- Create an Equal Interval Search object
search_instance = Equal_In_search:new(f, a, b, e)

-- Perform the search
iterations = search_instance:search()

-- Pretty print the result
search_instance:pretty_print(iterations)

```

### RaondomWalk Optimization Method
```lua
Example function
function example_function(X)
    -- Example: A simple quadratic function
    return (X[1] - X[2] + 2 * X[1]^2 + 2 * X[2] * X[1] + X[2]^2)
end

-- Initial guess (X1)
local initial_guess = {0.0, 0.0}

-- Create a Random Walk Optimization instance
local random_walk = RandomWalkOptimization:new(example_function, initial_guess)

-- Perform the search
local X_min, f_min = random_walk:search()

print(string.format("Estimated minimum at X = [%.8f, %.8f] with f(X) = %.12f", X_min[1], X_min[2], f_min))

```