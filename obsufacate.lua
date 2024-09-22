function xorEncryptDecrypt(input, key)
    local result = {}
    for i = 1, #input do
        local char = string.byte(input, i)
        local encryptedChar = bit32.bxor(char, key) -- XOR операция с использованием ключа
        table.insert(result, string.char(encryptedChar))
    end
    return table.concat(result)
end

-- Возвращаем функцию
return xorEncryptDecrypt
