-- This file contains functions to return an affine encryption, provided a message
standardAlphabet = {"b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}
standardAlphabet[0] = "a" -- Index start at 0 for calculations

-- This function is a helper function, you can find similar examples online
-- gcd finds the greatest common divisor among 2 numbers
function gcd(a, b)
    if(b == 0) then
        return a
    end
    return gcd(b, a%b)
end

-- This function is a helper function, you can find similar examples online
-- modInverse finds the modulo inverse of a % m
function modInverse(a, m)
    if(gcd(a,m) ~= 1) then
        return -1
    end
    for i = 1, m do
        if ((a%m)*(i%m))%m == 1 then
            return i
        end
    end
    return 1
end

-- This function is a helper function, you can find similar examples online
-- contains finds if a provided pattern is in a string, not case sensitive
function contains(message, pattern)
    local lowerMessage = string.lower(message)
    local lowerPattern = string.lower(pattern)
    for i=1, #message do
        if lowerMessage:sub(i,i+#pattern-1) == lowerPattern then
            return 1
        end
    end
    return 0
end

-- This function returns an encrypted version of the provided string
-- Affine cipher is (ax+b) mod m where x is the character, b is the shift, m is the length of the alphabet(M is the alphabet), and a is a coprime of m
function affine(message, a, b, M)
    local lowercaseMessage = string.lower(message)
    local encryptedMessage = ""
    -- For every charcter in the string
    for i = 1, #lowercaseMessage do
        local index = nil
        -- For every letter in the alphabet
        for j = 0, #M+1 do
            if M[j] == lowercaseMessage:sub(i,i) then
                index = j
                break
            end
        end
        -- If the letter is in the alphabet
        if(index ~= nil) then
            encryptedMessage = encryptedMessage .. M[((a*index)+b)%(#M+1)]
        else
            encryptedMessage = encryptedMessage .. lowercaseMessage:sub(i,i)
        end
    end
    return encryptedMessage
end

-- This function returns a decrypted version of the provided string
-- Affine inverse cipher is (ax+b) mod m where x is the character, b is the shift, m is the length of the alphabet(M is the alphabet), and a is a coprime of m
function affineInverse(message, a, b, M)
    local lowercaseMessage = string.lower(message)
    local decryptedMessage = ""
    -- For every charcter in the string
    for i=1, #lowercaseMessage do
        local index = nil
        -- For every letter in the alphabet
        for j = 0, #M+1 do
            if M[j] == lowercaseMessage:sub(i,i) then
                index = j
                break
            end
        end
        -- Check if a and m(#M+1) are coprime
        if modInverse(a,#M+1) == -1 then
            return "error: Invalid Input, a and m are not coprime"
        end
        -- If the letter is in the alphabet
        if(index ~= nil) then
            decryptedMessage = decryptedMessage .. M[(modInverse(a,#M+1)*(index-b))%(#M+1)]
        else
            decryptedMessage = decryptedMessage .. lowercaseMessage:sub(i,i)
        end
    end
    return decryptedMessage
end

-- This function returns an encrypted string, assuming the latin alphabet
function affineCipher(message, a, b)
    return affine(message, a, b, standardAlphabet)
end

-- This function returns an encrypted string, using random values for a and b (if alphabet differ == 0 it uses standardAlphabet)
function affineRandom(message, alphabet_differs, new_alphabet)
    -- Passed in Alphabet
    if alphabet_differs ~= 0 then
        local a = math.floor(math.random(1, #new_alphabet+1))
        -- Get a random a such that a is coprime to m(alphabet length)
        while(modInverse(a, #alphabet+1) == -1) do
            a = math.floor(math.random(1, #new_alphabet+1))
        end
        -- Get a random shift from 1 to one less than the alphabet length
        local b = math.floor(math.random(1, #new_alphabet+1))
        return affine(message, a, b, new_alphabet)
    -- Standard Alphabet
    else
        local a = math.floor(math.random(1, #standardAlphabet+1))
        -- Get a random a such that a is coprime to m(alphabet length)
        while(modInverse(a, #standardAlphabet+1) == -1) do
            a = math.floor(math.random(1, #standardAlphabet+1))
        end
        -- Get a random shift from 1 to one less than the alphabet length
        local b = math.floor(math.random(1, #standardAlphabet+1))
        return affine(message, a, b, standardAlphabet)
    end
end

-- This function prints the possibilities of an encoded string given a pattern to look for, pass in "" for no pattern
-- This function assumes the standard alphabet
function affineDecipher(message, pattern)
    -- For each possible a value
    for a=1, #standardAlphabet do
        -- If a is coprime to the length of the alphabet
        if modInverse(a, #standardAlphabet+1) ~= -1 then
            -- For each possible b value
            for b=1, #standardAlphabet do
                local decryption = affineInverse(message, a, b, standardAlphabet)
                -- Check if the following decryption contains the pattern
                if contains(decryption, pattern) == 1 then
                    -- Print the decryption and details the pattern was found
                    print("a: ", a, " b: ", b, " message: ", decryption)
                end
            end
        end
    end
end

-- This function prints the possibilities of an encoded string given a max a and b
-- This function assumes the standard alphabet
function affineDecipherAB(message, aMin, aMax, bMin, bMax)
    if (aMin>aMax) or (bMin>bMax) then
        print("error: Invalid parameters, a minimum value is greater than a maximum value")
    end
    if (aMax>#standardAlphabet) or (bMax>#standardAlphabet) then
        print("error: Invalid parameters, a maximum value is too high for the given language")
    end
    -- For each possible a value
    for a=aMin, aMax do
        -- If a is coprime to the length of the alphabet
        if modInverse(a, #standardAlphabet+1) ~= -1 then
            -- For each possible b value
            for b=bMin, bMax do
                local decryption = affineInverse(message, a, b, standardAlphabet)
                -- Print the decryption and details the pattern was found
                print("a: ", a, " b: ", b, " message: ", decryption)
            end
        end
    end
end

--[[ Cases to demonstrate code function
    local test = affineRandom("You can write pretty much anything you want here!", 0, nil)
    local barrier = "-------------------------"
    print(test)
    print(barrier)
    affineDecipher(test, "You")
    print(barrier)
    affineDecipher(test, "could")
    print(barrier)
    affineDecipher(test, "see")
    print(barrier)
    affineDecipher(test, "many options")
    print(barrier)
    affineDecipher(test, "ou")
    print(barrier)
    affineDecipher(test, "")
    local test2 = affineCipher("You can write pretty much anything you want here!", 17, 13)
    print(barrier)
    affineDecipherAB(test2, 10, 20, 10, 15)
]]