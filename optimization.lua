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
Finbonacci_Search = {}

Finbonacci_Search.__index = Finbonacci_Search

function Finbonacci_Search:value(n)
    local fib = {0,1}
    for i = 2,n do
        table.insert(fib,fib[#fib] + fib[#fib-1])
    end
    return fib
end

function Finbonacci_Search:new(func,a,b,n,tolerance)
    local obj = {f = func,a = a,b = b,n = n,tol = tolerance or 1e-5,iterations = {}}
    setmetatable(obj,Finbonacci_Search)
    return obj
end

function Finbonacci_Search:solve()
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

function Finbonacci_Search:pretty_print()
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

-- local search = Finbonacci_Search:new(f, 2, 3, 15)
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


