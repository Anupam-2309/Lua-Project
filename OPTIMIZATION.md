# Bisection Method in LuaLaTeX

This repository contains a Lua implementation of the **Bisection Method** integrated with **LuaLaTeX** for solving nonlinear equations. The Bisection Method is a root-finding algorithm that iteratively narrows down an interval containing a root by halving the interval.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [How It Works](#how-it-works)
- [Usage](#usage)
- [Running the Lua Script](#running-the-lua-script)
- [Integrating with LuaLaTeX](#integrating-with-lualatex)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

## Features
- A customizable Lua Bisection method that can solve different equations.
- Integration with LaTeX using **LuaLaTeX**, allowing computation and typesetting within the same document.
- Step-by-step output of the Bisection Method, including iteration data.

## Requirements
- **Lua**: To run the Bisection method as a standalone Lua script.
- **LuaLaTeX**: For running Lua code inside LaTeX documents.

## How It Works
The Bisection Method works by repeatedly halving the interval `[a, b]` and checking if the midpoint contains the root. This process continues until the interval size is smaller than a given tolerance.

### Steps:
1. Define an equation `f(x)` in Lua.
2. Run the Bisection method to solve `f(x) = 0` for a given interval `[a, b]`.
3. The solution is found when the error between `a` and `b` becomes smaller than the tolerance.

## Usage

### Standalone Lua Script
You can use the provided Lua script as a standalone implementation to solve equations using the Bisection Method.

```lua
-- Example Lua Script to solve f(x) = x^3 - 2x - 5 using Bisection
Bisection = {}
Bisection.__index = Bisection

function Bisection:new(a, b, func, tolerance)
    local obj = { a = a, b = b, f = func, tolerance = tolerance or 0.001 }
    setmetatable(obj, Bisection)
    return obj
end

function Bisection:solve()
    local error = math.abs(self.b - self.a)
    local c
    iter = 0
    while error > self.tolerance do
        c = (self.a + self.b) / 2
        if self.f(c) > 0 then
            self.b = c
        else
            self.a = c
        end
        error = math.abs(self.b - self.a)
        iter = iter + 1
        print(string.format("Iter %d: a=%.6f, b=%.6f, f(c)=%.6f", iter, self.a, self.b, self.f(c)))
    end
    return self.a, self.b
end

-- Define equation f(x) = x^3 - 2x - 5
local equation = function(x)
    return x^3 - 2*x - 5
end

-- Solve using Bisection Method
bisectionSolver = Bisection:new(2, 3, equation, 0.001)
bisectionSolver:solve()
