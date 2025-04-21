-- function that finds all the even numbers in a given range from 1 to max
function even(max)
    local sequence = {}
    for i = 1, max do
        if i % 2 == 0 then
            sequence[i/2] = i
        end
    end
    return sequence
end

print(table.concat(even(16), ", "))