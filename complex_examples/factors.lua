-- This function computes all the factors of the integer num
function factors(num)
    local factorArray = {}
    -- variable j is a placeholder for each index
    local j = 1
    for i = 1, num do
        local integer, decimal = math.modf(num/i) -- The modf function returns the integer and decimal of a float seperate from each other
        if(decimal == 0.0) then
            factorArray[j] = integer
            j = j + 1
        end
    end
    return factorArray
end

print("Enter an integer you wish to factor: ")
numToFactor = io.read() -- reads from stdin

local factorArray = factors(numToFactor)
if(factorArray[1] == nil) then -- The number could not be factored, occurs for doubles but strings provide errors
    print("The program could not factor the input")
else
    local arrayLength = #factorArray
    local factorString = ""
    for i = 1, arrayLength-1 do
        factorString = factorString .. tostring(factorArray[i]) .. ", " -- .. represents concatenation
    end
    factorString = factorString .. tostring(factorArray[arrayLength])
    print("The factors of your number are:", factorString) -- , replaces + for variables
end