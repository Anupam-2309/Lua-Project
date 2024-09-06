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


-----------------------------------------------------
-- Define the GoldenSectionSearch class
GoldenSectionSearch = {}
GoldenSectionSearch.__index = GoldenSectionSearch

-- Constructor for GoldenSectionSearch
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
        
        if self:f(x1) <= self:f(x2) then
            self.R = x2
        else
            self.L = x1
        end
    end
end

-- -- Function to be minimized f(x) = (x - 2)^2
-- function GoldenSectionSearch:f(x)
--     return (x - 3) ^ 2
-- end

-- -- Instantiate and run Golden Section Search
-- goldenSectionSearch = GoldenSectionSearch:new(f,-5, 15, 10)
-- goldenSectionSearch:search()