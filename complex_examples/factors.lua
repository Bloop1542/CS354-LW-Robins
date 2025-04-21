-- This function computes all the factors of the number num
function factors(num)
    local factorArray = {}
    -- variable j is a placeholder for each index
    local j = 1
    for i = 1, num do
        local integer, decimal = math.modf(num/i) -- The modf function returns the integer and decimal of a float seperate from each other
        if(decimal == 0.0) then
            factorArray[j] = integer
            j = j + 1
            print(integer)
        end
    end
    return factorArray
end

factors(1024)
print("-----")
print(factors(17)[2]) -- Prints the item at the second index of the returned array