-- This function computes the factorial of the number num
function factorial(num)
    local product = 1
    for i = 1, num do
        product = product * i
    end
    print(product)
end

factorial(6)