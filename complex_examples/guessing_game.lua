math.randomseed(os.time())

local secret = math.random(1, 100)
local guess = nil
local attempts = 0

print("I'm thinking of a number between 1 and 100. Can you guess it?")

while guess ~= secret do
    io.write("Enter your guess: ")
    guess = tonumber(io.read())
    attempts = attempts + 1

    if not guess then
        print("Please enter a valid number.")
    elseif guess < secret then
        print("Too low!")
    elseif guess > secret then
        print("Too high!")
    else
        print("🎉 Correct! You guessed it in " .. attempts .. " tries.")
    end
end
