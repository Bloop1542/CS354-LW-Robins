function add(a, b)
    return a + b
end

function subtract(a, b)
    return a - b
end

function multiply(a, b)
    return a * b
end

function divide(a,b)
    return a / b
end

function exponent(a,b)
    return a ^ b
end

print("Enter a number:")
num1 = io.read()
print("Enter one of these operator (+, -, *, /, ^)")
operator = io.read()
print("Enter a number:")
num2 = io.read()

result = 0
--No proper switch statements in Lua, get to use if blocks
if operator == "+" then
    result = add(num1, num2)
end
if operator == "-" then
    result = subtract(num1, num2)
end
if operator == "*" then
    result = multiply(num1, num2)
end
if operator == "/" then
    result = divide(num1, num2)
end
if operator == "^" then
    result = exponent(num1, num2)
end
if result == 0 then
    print("Operator was not valid, please try again")
else
    print(num1 .. " " .. operator .. " " .. num2 .. " = " .. result)
end
