--Checks if a given number is prime
function isPrime(number) 
    if number <= 1 then
        return false
    end
    for i = 2, math.floor(math.sqrt(number)) + 1 do
        if number % i == 0 then
            return false
        else 
            return true
        end
    end
end

givenNumber = 5
print(givenNumber .. " is a Prime: " .. (isPrime(givenNumber) and 'true' or 'false'))
