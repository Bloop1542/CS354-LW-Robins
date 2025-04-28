--Author: Matthew Trent
--Description: Implements a vigenre cipher using Lua
--Date: April 27, 2025

--String that contains lowercase, Uppercase and numbers
--Used for getting index of character in message
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
vingereKey = "KeyedMessage"

--Encodes a given message using the global vingere key value,
--If the message is longer than the key it will repeat the key as manyy times as needed
function encodeVigenere(message)
    local encodedMessage = ""
    
    --Runs through entire message, chracter by character
    for i = 1, #message do
        --Gets the character at index i in the message
        local messageChar = message:sub(i,i)
        if messageChar ~= " " then 
            local messageCharIndex = alphabet:find(messageChar)

            --Gets the alphabet value of a the given character in key
            --Rolls around if the message is longer than the key
            local keyCharIndex = alphabet:find(vingereKey:sub(i % #vingereKey, i % #vingereKey))
            local encodeIndex = (keyCharIndex + messageCharIndex) % #alphabet
            encodedMessage = encodedMessage .. alphabet:sub(encodeIndex, encodeIndex)
        else
            encodedMessage = encodedMessage .. " "
        end
    end
    return encodedMessage
end

--Decodes a provided message using a vigenere cipjer
function decodeVigenere(message)
    local encodedMessage = ""
    
    --Runs through entire message, chracter by character
    for i = 1, #message do
        --Gets the character at index i in the message
        local messageChar = message:sub(i,i)
        if messageChar ~= " " then 
            local messageCharIndex = alphabet:find(messageChar)

            --Gets the alphabet value of a the given character in key
            --Rolls around if the message is longer than the key
            local keyCharIndex = alphabet:find(vingereKey:sub(i % #vingereKey, i % #vingereKey))
            local encodeIndex = (#alphabet + (messageCharIndex - keyCharIndex)) % #alphabet
            encodedMessage = encodedMessage .. alphabet:sub(encodeIndex, encodeIndex)
        else
            encodedMessage = encodedMessage .. " "
        end
    end
    return encodedMessage
end

message = "This message will be encoded and decoded"
encodedMessage = encodeVigenere(message)

print(message)
print(encodedMessage)
print(decodeVigenere(encodedMessage))