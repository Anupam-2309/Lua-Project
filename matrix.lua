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

-- Function to add two matrices
function addMatrices(matrixA, matrixB)
    local n = #matrixA   -- gives the number of row
    local m = #matrixA[1]  -- gives the number column
    local result = createMatrix(n, m)  --using above function 

    for i = 1, n do
        for j = 1, m do
            result[i][j] = matrixA[i][j] + matrixB[i][j]
        end
    end

    return result
end

-- Function to subtract two matrices
function subtractMatrices(matrixA, matrixB)
    local n = #matrixA  -- gives the number of row
    local m = #matrixA[1]  -- gives the number column
    local result = createMatrix(n, m)

    for i = 1, n do
        for j = 1, m do
            result[i][j] = matrixA[i][j] - matrixB[i][j]
        end
    end

    return result
end

function multiplyMatrices(matrixA, matrixB)
    local n = #matrixA -- gives the number of row
    local m = #matrixB[1] -- gives the number column
    local p = #matrixB -- gives the number of row
    local result = createMatrix(n, m)

    for i = 1, n do
        for j = 1, m do
            result[i][j] = 0
            for k = 1, p do
                result[i][j] = result[i][j] + matrixA[i][k] * matrixB[k][j]
            end
        end
    end

    return result
end

-- Function to transpose a matrix
function transposeMatrix(matrix)
    local n = #matrix
    local m = #matrix[1]
    local result = createMatrix(m, n)

    for i = 1, n do
        for j = 1, m do
            result[j][i] = matrix[i][j]
        end
    end

    return result
end

-- For Printing Matrix 
function printM(M)
	n = #M
	m = #M[1]
	for i = 1, n do
	    for j = 1, m do
	        io.write(M[i][j] .. " ")
	    end
    io.write("\n")
	end
end

-- Examples 


-- local values = {1, 2, 3, 4, -4, 7, 8, 9}
-- n = 2
-- m = 4
-- local matrixA = createMatrix(n, m, values)

-- -- Print the matrix to verify
-- for i = 1, n do
--     for j = 1,m do
--         io.write(matrixA[i][j] .. " ")
--     end
--     io.write("\n")
-- end

-- print(#matrixA[1])
