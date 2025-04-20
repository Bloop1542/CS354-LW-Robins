function fizzbuzz(max)
    local sequence = {}
    for i = 1, max do
        local temp = ""
        if i % 3 == 0 then 
            temp = temp .. "fizz"
        end
        if i % 5 == 0 then
            temp = temp .. "buzz"
        end
        if temp == "" then 
            temp = temp .. i
        end
        sequence[i] = temp
    end
    return sequence
end

print(table.concat(fizzbuzz(15), ", "))


