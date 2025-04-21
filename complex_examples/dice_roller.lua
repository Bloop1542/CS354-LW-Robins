-- Dice Roller with Re-roll and Sum Feature

math.randomseed(os.time())  -- Seed RNG

-- Function to roll a single six-sided die
function rollDie()
    return math.random(1, 6)
end

-- Function to roll both dice
function rollDice()
    return rollDie(), rollDie()
end

-- Function to display the dice and total
function showResults(d1, d2)
    print("Die 1: " .. d1)
    print("Die 2: " .. d2)
    print("Total: " .. (d1 + d2))
end

-- Function to ask if user wants to reroll
function askReroll()
    print("\nWould you like to reroll?")
    print("Type: '1' to reroll Die 1")
    print("Type: '2' to reroll Die 2")
    print("Type: 'both' to reroll both dice")
    print("Type: 'n' to keep current roll")
    io.write("> ")
    return io.read()
end

-- Main loop
local d1, d2 = rollDice()
showResults(d1, d2)

while true do
    local choice = askReroll()

    if choice == "1" then
        d1 = rollDie()
        showResults(d1, d2)
    elseif choice == "2" then
        d2 = rollDie()
        showResults(d1, d2)
    elseif choice == "both" then
        d1, d2 = rollDice()
        showResults(d1, d2)
    elseif choice == "n" then
        print("Final roll:")
        showResults(d1, d2)
        break
    else
        print("Invalid input. Please try again.")
    end
end