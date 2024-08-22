-- Function to create a matrix
function createMatrix(n, m, initialValue)
    local matrix = {}
    for i = 1, n do
        matrix[i] = {}
        for j = 1, m do
            matrix[i][j] = initialValue or 0
        end
    end
    return matrix
end

-- Example: Create a 3x3 matrix initialized to 0
local matrixA = createMatrix(3, 3)

-- Initialize matrixA with specific values
matrixA[1][1] = 1; matrixA[1][2] = 2; matrixA[1][3] = 3
matrixA[2][1] = 4; matrixA[2][2] = 5; matrixA[2][3] = 6
matrixA[3][1] = 7; matrixA[3][2] = 8; matrixA[3][3] = 9

-- Print the Matrix
for i = 1, #matrixA do
    for j = 1, #matrixA[i] do
        print(matrixA[i][j])
    end
    print()
end