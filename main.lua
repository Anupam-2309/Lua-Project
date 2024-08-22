--[[
Lua Basics: A Comprehensive Overview
This script covers fundamental Lua concepts such as variables, loops, conditionals,
functions, tables, and more. It's a great starting point for beginners.
--]]

-- 1. Variables and Data Types
-- Lua is dynamically typed, meaning you don't need to declare the type of a variable.

local num = 10        -- Integer
local str = "Hello"   -- String
local bool = true     -- Boolean
local nilValue = nil  -- Nil (represents no value)

-- 2. Basic Arithmetic Operations
-- Lua supports typical arithmetic operations.

local sum = 10 + 5    -- Addition
local diff = 10 - 5   -- Subtraction
local prod = 10 * 5   -- Multiplication
local div = 10 / 5    -- Division
local mod = 10 % 3    -- Modulus
local exp = 10 ^ 2    -- Exponentiation

-- 3. Strings and String Operations
-- Strings are sequences of characters enclosed in quotes.

local greeting = "Hello, Lua!"
local length = #greeting             -- Get the length of the string
local upper = string.upper(greeting) -- Convert to uppercase
local lower = string.lower(greeting) -- Convert to lowercase
local sub = string.sub(greeting, 1, 5) -- Get a substring (from index 1 to 5)

-- 4. Conditionals
-- Lua supports standard conditional structures like if, else, and elseif.

local age = 20

if age < 18 then
    print("You are a minor.")
elseif age >= 18 and age < 65 then
    print("You are an adult.")
else
    print("You are a senior.")
end

-- 5. Loops
-- Lua supports for loops, while loops, and repeat-until loops.

-- 5.1 For Loop
for i = 1, 5 do
    print("For loop iteration: " .. i)
end

-- 5.2 While Loop
local count = 1
while count <= 5 do
    print("While loop count: " .. count)
    count = count + 1
end

-- 5.3 Repeat-Until Loop
repeat
    print("Repeat-until loop count: " .. count)
    count = count - 1
until count == 0

-- 6. Functions
-- Functions in Lua can be defined and stored in variables.

function greet(name)
    return "Hello, " .. name .. "!"
end

local message = greet("Lua")
print(message)

-- 7. Tables
-- Tables are the only data structure in Lua and can be used as arrays, dictionaries, etc.

-- 7.1 Array (Sequential Index)
local fruits = {"Apple", "Banana", "Cherry"}

for i = 1, #fruits do
    print(fruits[i])
end

-- 7.2 Dictionary (Key-Value Pairs)
local person = {
    name = "John",
    age = 30,
    job = "Engineer"
}

print(person.name)  -- Accessing a value by key

-- 7.3 Nested Tables
local matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
}

print(matrix[2][3])  -- Accessing element 6 from the matrix

-- 8. Iterating Over Tables
-- Using pairs() for key-value tables and ipairs() for array-like tables.

-- 8.1 Iterating with pairs()
for key, value in pairs(person) do
    print(key .. ": " .. value)
end

-- 8.2 Iterating with ipairs()
for index, value in ipairs(fruits) do
    print(index .. ": " .. value)
end