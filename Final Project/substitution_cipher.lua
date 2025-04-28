-- Standard alphabet
local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

-- Example key: maps each letter to a new unique letter
local key = "QWERTYUIOPASDFGHJKLZXCVBNM"

-- Lookup tables for encryption and decryption
local encrypt_map = {}
local decrypt_map = {}

-- Build lookup tables
for i = 1, #alphabet do
    local plain_letter = alphabet:sub(i, i)
    local cipher_letter = key:sub(i, i)
    encrypt_map[plain_letter] = cipher_letter
    decrypt_map[cipher_letter] = plain_letter
end

-- Encrypt a message
function encrypt(message)
    local result = ""
    for i = 1, #message do
        local char = message:sub(i, i):upper()
        if encrypt_map[char] then
            result = result .. encrypt_map[char]
        else
            result = result .. char  -- Non-letters are copied directly
        end
    end
    return result
end

-- Decrypt a message
function decrypt(message)
    local result = ""
    for i = 1, #message do
        local char = message:sub(i, i):upper()
        if decrypt_map[char] then
            result = result .. decrypt_map[char]
        else
            result = result .. char
        end
    end
    return result
end

-- Example usage
print("Enter a word or sentence to encrypt:")
local input = io.read()

local encrypted = encrypt(input)
print("Encrypted:", encrypted)

local decrypted = decrypt(encrypted)
print("Decrypted:", decrypted)