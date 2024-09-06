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