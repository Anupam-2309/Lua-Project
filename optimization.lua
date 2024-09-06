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
local equation1 = function(x)
    return x^3 - 2*x - 5
end

bisectionSolver1 = Bisection:new(2, 3, equation1, 0.001)
bisectionSolver1:solve()

-- Example 2: Solve f(x) = x^2 - 4
local equation2 = function(x)
    return x^2 - 4
end

bisectionSolver2 = Bisection:new(0, 3, equation2, 0.001)
bisectionSolver2:solve()
