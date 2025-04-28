calcTable = {
    ["+"] = function (a, b)
        return a + b
    end,
    ["-"] = function (a, b)
        return a - b
    end,
    ["*"] = function (a, b)
        return a * b
    end,
    ["/"] = function (a,b)
        return a / b
    end,
    ["^"] = function (a,b)
        return a ^ b
    end,
}

print("Enter a number:")
num1 = io.read()
print("Enter one of these operator (+, -, *, /, ^)")
operator = io.read()
print("Enter a number:")
num2 = io.read()

result = 0
if(calcTable[operator]) then
    result = calcTable[operator](num1,num2)
end

if result == 0 then
    print("Operator was not valid, please try again")
else
    print(num1 .. " " .. operator .. " " .. num2 .. " = " .. result)
end
