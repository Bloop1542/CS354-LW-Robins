-- Author: Alec Conn

alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

-- Encodes a message by shifting each character
function encodeCaesar(message, shift)
    local encoded = ""
    for i = 1, #message do
        local char = message:sub(i, i)
        if char == " " then
            encoded = encoded .. " "
        else
            local idx = alphabet:find(char)
            if idx then
                local newIdx = ((idx - 1 + shift) % #alphabet) + 1
                encoded = encoded .. alphabet:sub(newIdx, newIdx)
            else
                encoded = encoded .. char  -- Keep non-alphabet chars
            end
        end
    end
    return encoded
end

-- Decodes an encoded message
function decodeCaesar(encoded, shift)
    return encodeCaesar(encoded, -shift)  -- Reuse encode with negative shift
end

-- Get user input
io.write("Enter the message to encode: ")
local message = io.read()

local shift
repeat
    io.write("Enter the shift value (must be a number): ")
    shift = tonumber(io.read())
until shift ~= nil  -- Loop until valid number is entered

-- Encode and display
local encoded = encodeCaesar(message, shift)
print("\nEncoded message: " .. encoded)

-- Decode and verify
local decoded = decodeCaesar(encoded, shift)
print("Decoded message: " .. decoded)