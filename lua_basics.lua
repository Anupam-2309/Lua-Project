-- function load_csv(filename)
--     local file = io.open(filename, "r")
--     local data = {}
--     if file then
--         for line in file:lines() do
--             local row = {}
--             for num in string.gmatch(line, "([^,]+)") do
--                 table.insert(row, tonumber(num) or 0)  -- Handle non-numeric values gracefully
--             end
--             table.insert(data, row)
--         end
--         file:close()
--     else
--         print("Error: Could not open file " .. filename)
--     end
--     return data
-- end

-- local data = load_csv("C:/Users/Anupam/Downloads/file.csv")

-- for col = 1, #data[1] do
--     local column_data = {}
--     for row = 1, #data do
--         --print(data[row][col])
--     end

-- end

-- print(#data[1])


data = {{0,-6,3,6,-3},{-4,-1,-6,1,5},{8,-2,5,0,5}}

local a = #data
local b = #data[1]

local total_sum, total_count= 0, 0
for _, row in ipairs(data) do
    for _, value in ipairs(row) do
        total_sum = total_sum + value
        total_count = total_count + 1
    end
end
local grand_mean = total_sum / total_count
local C = total_sum^2/total_count

local df_A = a-1
local df_B = b-1
local df_within = total_count -1
local df_AB = df_within - df_A - df_B

--SST 
local SS = 0
for _,row in ipairs(data) do 
    for _,value in ipairs(row) do
        SS = SS + value^2
    end
end
local SST = SS - C

-- Calculate row sums
local row_sums = {}
for i, row in ipairs(data) do
    local sum = 0
    for _, value in ipairs(row) do
        sum = sum + value
    end
    table.insert(row_sums, sum)
end

-- Calculate column sums
local col_sums = {}
local num_cols = #data[1]
for j = 1, num_cols do
    local sum = 0
    for i = 1, #data do
        sum = sum + data[i][j]
    end
    table.insert(col_sums, sum)
end

-- SSA
local ssa = 0
for _,i in ipairs(row_sums) do 
    ssa = ssa + (i^2)/b
end
local SSA = ssa - C

-- SSB
local ssb = 0
for _,i in ipairs(col_sums) do 
    ssb = ssb + (i^2)/a
end
local SSB = ssb - C
local SSE = SST - SSA -SSB

local MSA = SSA / df_A
local MSB = SSB / df_B
local MSE = SSE / df_AB

local F_A = MSA/MSE
local F_B = MSB/MSE

print(C)
print(SSA,SSB,SSE,SST)
print(a,b)
print(df_A,df_B,df_AB,df_within)
print(MSA,MSB,MSE)
print(F_A,F_B)
