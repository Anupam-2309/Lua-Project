Bisection = {}
Bisection.__index = Bisection

-- Constructor for Bisection
function Bisection:new(a, b, func, tolerance)
    local obj = { a = a, b = b, f = func, tolerance = tolerance or 0.001 }
    setmetatable(obj, Bisection)
    return obj
end

-- Bisection method logic
function Bisection:solve()
    local error = math.abs(self.b - self.a)
    local c
    print("Iter  |  a          |  b          |  f(c)")
    print("------------------------------------------")
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
        print(string.format("%-5s | %-10.6f | %-10.6f | %-10.6f",iter, self.a, self.b, self.f(c)))
    end
    return self.a, self.b
end

-- Example 1: Solve f(x) = x^3 - 2x - 5
-- local equation1 = function(x)
--     return x^3 - 2*x - 5
-- end

-- bisectionSolver1 = Bisection:new(2, 3, equation1, 0.001)
-- bisectionSolver1:solve()


---------------------------------------------------------------------------------------------------
-- Define the GoldenSectionSearch class
GoldenSectionSearch = {}
GoldenSectionSearch.__index = GoldenSectionSearch

-- Constructor
function GoldenSectionSearch:new(func,L, R, n)
    local obj = { f = func ,L = L, R = R, n = n }
    setmetatable(obj, GoldenSectionSearch)
    return obj
end

-- Golden section search logic
function GoldenSectionSearch:search()
    print(string.format("%-5s | %-12s | %-12s", "Iter", "L", "R"))
    print(string.rep("-", 35))
    
    for i = 1, self.n do
        local x2 = self.L + 0.618 * (self.R - self.L)
        local x1 = self.L + self.R - x2
        print(string.format("%-5d | %-12.6f | %-12.6f", i, self.L, self.R))
        
        if self.f(x1) <= self.f(x2) then
            self.R = x2
        else
            self.L = x1
        end
    end
end

-- -- Function to be minimized f(x) = (x - 2)^2
-- local equation1 = function(x)
--     return (x - 3) ^ 2
-- end

-- -- Instantiate and run Golden Section Search
-- goldenSectionSearch = GoldenSectionSearch:new(equation1,-5, 15, 10)
-- goldenSectionSearch:search()



-- ==============================================================================================================
Fibonacci_search = {}

Fibonacci_search.__index = Fibonacci_search

function Fibonacci_search:value(n)
    local fib = {0,1}
    for i = 2,n do
        table.insert(fib,fib[#fib] + fib[#fib-1])
    end
    return fib
end

function Fibonacci_search:new(func,a,b,n,tolerance)
    local obj = {f = func,a = a,b = b,n = n,tol = tolerance or 1e-5,iterations = {}}
    setmetatable(obj,Fibonacci_search)
    return obj
end

function Fibonacci_search:solve()
    local fib = self:value(self.n)
    if #fib < self.n then
        error("Fibonacci sequence length mismatch")
    end
    local iteration = {}
    for  i = 1,self.n-2 do
        local L = self.b-self.a
        local k = fib[#fib-i-2]/fib[#fib-i]
        local c = self.a + k*L
        local d = self.b - k*L
        table.insert(iteration,{a = self.a, b = self.b})

        if self.f(c) < self.f(d) then
            self.b = d
        else
            self.a = c
        end
    end
    self.iterations = iteration
    return iteration
end

function Fibonacci_search:pretty_print()
    if #self.iterations == 0 then
        self:solve() -- Solve if not already solved
    end

    print(string.format("%-10s %-10s", "a", "b"))
    for _, iter in ipairs(self.iterations) do
        print(string.format("%-10.5f %-10.5f", iter.a, iter.b))
    end
end

-- local function f(x)
--     return x^3 -2 *x -5
-- end

-- local search = Fibonacci_search:new(f, 2, 3, 15)
-- search:solve()  
-- search:pretty_print() 

-- ============================================================================================================
Quadratic_Interpolation = {}

Quadratic_Interpolation.__index = Quadratic_Interpolation

function Quadratic_Interpolation:new(func,a,b,tolerance)
    local obj = {f = func,a = a,b = b,tol = tolerance or 1e-5,c = nil}
    setmetatable(obj,Quadratic_Interpolation)
    return obj
end

function Quadratic_Interpolation:x()
    local a, b, c = self.a, self.b, self.c
    return ((self.f(a) * (b^2 - c^2) + self.f(b) * (c^2 - a^2) + self.f(c) * (a^2 - b^2)) /
           (2 * (self.f(a) * (b - c) + self.f(b) * (c - a) + self.f(c) * (a - b))))
end

function Quadratic_Interpolation:solve()
    self.c = self.a + (self.b - self.a )/2
    local iterations = {}
    while math.abs(self.b - self.a) > self.tol do
        local x_new = self:x()
        table.insert(iterations, {a = self.a, b = self.b, c = self.c,xnew = x_new})
        if x_new < self.c and self.f(x_new) < self.f(self.c) then
            self.b = self.c
            self.c = x_new
        elseif x_new < self.c and self.f(x_new) >= self.f(self.c) then
            self.a = x_new
        elseif x_new > self.c and self.f(x_new) < self.f(self.c) then
            self.a = self.c
            self.c = x_new
        else
            self.b = x_new
        end
    end
    return iterations
end

function Quadratic_Interpolation:pretty_print()
    local iterations = self:solve()
    print(string.format("%-10s %-10s %-10s %-10s", "a", "b", "c","x new"))
    for _, iter in ipairs(iterations) do
        print(string.format("%-10.5f %-10.5f %-10.5f %-10.5f", iter.a, iter.b, iter.c , iter.xnew))
    end
end

-- local function f(x)
--     return x^3 - 2*x - 5  -- Example function to minimize
-- end

-- local search = Quadratic_Interpolation:new(f, 2, 3, 1e-3)
-- search:pretty_print()

-- -- =========================================================================================

Equal_In_search = {}

Equal_In_search.__index = Equal_In_search

function Equal_In_search:new(func,a,b,epsilon)
    local obj = {f = func,a = a, b = b , e = epsilon or 0.1}
    setmetatable(obj,Equal_In_search)
    return obj
end

function Equal_In_search:search()
    iterations = {}

    local i = 1

    while (self.b-self.a) >= self.e do 
        local x1 = self.a + (self.b - self.a)/3
        local x2 = self.b - (self.b - self.a)/3

        local f_x1 = self.f(x1)
        local f_x2 = self.f(x2)

        table.insert(iterations,{i,self.a,x1,x2,self.b,f_x1,f_x2})

        if f_x1 <= f_x2 then
            self.b = x2
        else
            self.a = x1
        end

        i = i+1
    end
    return iterations
end

function Equal_In_search:pretty_print(iterations)
    print(string.format("%-3s | %-10s | %-10s | %-10s | %-10s | %-10s | %-10s", "Iter", "a", "x1", "x2", "b", "f(x1)", "f(x2)"))
    print(string.rep("-", 75))
    for _, row in ipairs(iterations) do
        print(string.format("%-3d | %-10.5f | %-10.5f | %-10.5f | %-10.5f | %-10.5f | %-10.5f", 
            row[1], row[2], row[3], row[4], row[5], row[6], row[7]))
    end
end

-- -- Define the function
-- function f(x)
--     return 1 - x * math.exp(-x^2) - 0.5
-- end

-- -- Set up the problem
-- a = 0.2
-- b = 1.8
-- e = 0.1

-- -- Create an Equal Interval Search object
-- search_instance = Equal_In_search:new(f, a, b, e)

-- -- Perform the search
-- iterations = search_instance:search()

-- -- Pretty print the result
-- search_instance:pretty_print(iterations)

-- ===============================================================================

RandomWalkOptimization = {}
RandomWalkOptimization.__index = RandomWalkOptimization

-- Constructor
function RandomWalkOptimization:new(func, X1, lambda, epsilon, max_iterations)
    local obj = {
        f = func,
        X1 = X1, -- Initial guess
        lambda = lambda or 0.5,
        epsilon = epsilon or 0.01,
        max_iterations = max_iterations or 100,
        iteration = 1
    }
    setmetatable(obj, RandomWalkOptimization)
    return obj
end

-- Helper function to compute vector norm
function RandomWalkOptimization:norm(vec)
    local sum = 0
    for i = 1, #vec do
        sum = sum + vec[i] * vec[i]
    end
    return math.sqrt(sum)
end

-- Helper function to generate a random unit vector
function RandomWalkOptimization:random_unit_vector(n)
    while true do
        local r = {}
        for i = 1, n do
            table.insert(r, math.random() * 2 - 1) -- Random number in [-1, 1]
        end
        local R = self:norm(r) -- Compute the norm of the vector
        if R <= 1 then
            for i = 1, n do
                r[i] = r[i] / R -- Normalize to create a unit vector
            end
            return r
        end
    end
end

-- Search method
function RandomWalkOptimization:search()
    local f1 = self.f(self.X1)
    local n = #self.X1 -- Dimensionality of the problem

    while self.lambda > self.epsilon and self.iteration <= self.max_iterations do
        -- Generate a random unit vector
        local u = self:random_unit_vector(n)

        -- Compute new point and function value
        local X_new = {}
        for i = 1, n do
            X_new[i] = self.X1[i] + self.lambda * u[i]
        end

        local f_new = self.f(X_new)

        -- Compare function values
        if f_new < f1 then
            self.X1 = X_new
            f1 = f_new
        else
            self.iteration = self.iteration + 1
        end

        -- Check if maximum iterations reached
        if self.iteration > self.max_iterations then
            self.lambda = self.lambda / 2
            self.iteration = 1 -- Reset iteration counter
        end
    end

    return self.X1, f1
end

-- Example function
-- function example_function(X)
--     -- Example: A simple quadratic function
--     return (X[1] - X[2] + 2 * X[1]^2 + 2 * X[2] * X[1] + X[2]^2)
-- end

-- -- Initial guess (X1)
-- local initial_guess = {0.0, 0.0}

-- -- Create a Random Walk Optimization instance
-- local random_walk = RandomWalkOptimization:new(example_function, initial_guess)

-- -- Perform the search
-- local X_min, f_min = random_walk:search()

-- print(string.format("Estimated minimum at X = [%.8f, %.8f] with f(X) = %.12f", X_min[1], X_min[2], f_min))

