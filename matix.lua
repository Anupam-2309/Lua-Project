-- creating the function for Matrix 

function createMatrix(n, m, values)
    local matrix = {}
    local valueIndex = 1

    for i = 1, n do
        matrix[i] = {}
        for j = 1, m do
            if values and values[valueIndex] then
                matrix[i][j] = values[valueIndex]
                valueIndex = valueIndex + 1
            else
                matrix[i][j] = 0
            end
        end
    end

    return matrix
end

local values = {1, 2, 3, 4, -4, 7, 8, 9}
n = 2
m = 4
local matrixA = createMatrix(n, m, values)

-- Print the matrix to verify
for i = 1, n do
    for j = 1,m do
        io.write(matrixA[i][j] .. " ")
    end
    io.write("\n")
end
