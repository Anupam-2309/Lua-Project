-- 1. Basic Variables and Arithmetic Operations
local a = 10
local b = 5

-- Basic arithmetic
print("Basic Arithmetic:")
print("Addition:", a + b)      -- 15
print("Subtraction:", a - b)   -- 5
print("Multiplication:", a * b) -- 50
print("Division:", a / b)      -- 2
print("Exponentiation:", a ^ 2) -- 100
print("Modulo:", a % 3)        -- 1

-- 2. Mathematical Functions
print("\nMathematical Functions:")
print("Square root:", math.sqrt(16))    -- 4
print("Absolute value:", math.abs(-7))  -- 7
print("Floor:", math.floor(3.7))        -- 3
print("Ceiling:", math.ceil(3.7))       -- 4
print("Pi:", math.pi)                   -- 3.141592653589793
print("Sin(π/2):", math.sin(math.pi/2)) -- 1

-- 3. Working with Tables (Arrays/Matrices)
local vector = {1, 2, 3, 4, 5}
local matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
}

-- Vector operations
local function vectorSum(vec)
    local sum = 0
    for _, value in ipairs(vec) do
        sum = sum + value
    end
    return sum
end

-- Matrix operations
local function matrixTrace(mat)
    local trace = 0
    for i = 1, #mat do
        trace = trace + mat[i][i]
    end
    return trace
end

print("\nVector and Matrix Operations:")
print("Vector sum:", vectorSum(vector))
print("Matrix trace:", matrixTrace(matrix))

-- 4. Statistical Functions
local dataset = {10, 20, 30, 40, 50}

-- Calculate mean
local function mean(data)
    return vectorSum(data) / #data
end

-- Calculate variance
local function variance(data)
    local m = mean(data)
    local sum_sq_diff = 0
    for _, value in ipairs(data) do
        sum_sq_diff = sum_sq_diff + (value - m)^2
    end
    return sum_sq_diff / #data
end

-- Calculate standard deviation
local function stddev(data)
    return math.sqrt(variance(data))
end

print("\nStatistical Calculations:")
print("Mean:", mean(dataset))
print("Variance:", variance(dataset))
print("Standard Deviation:", stddev(dataset))

-- 5. Advanced Mathematical Operations
-- Function to calculate factorial
local function factorial(n)
    if n == 0 then return 1 end
    return n * factorial(n - 1)
end

-- Function to calculate combinations (nCr)
local function combination(n, r)
    return factorial(n) / (factorial(r) * factorial(n - r))
end

print("\nAdvanced Math:")
print("5! =", factorial(5))
print("Combinations (5,2) =", combination(5, 2))

-- 6. Numerical Methods
-- Simple Newton-Raphson method for finding square root
local function sqrt_newton(n, precision)
    local x = n
    local h = precision or 0.0001
    while math.abs(x*x - n) > h do
        x = (x + n/x) / 2
    end
    return x
end

print("\nNumerical Methods:")
print("Square root of 16 (Newton method):", sqrt_newton(16))
