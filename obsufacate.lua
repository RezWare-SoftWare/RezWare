-- Функция для XOR-шифрования и дешифрования
local function xorEncryptDecrypt(input, key)
    local result = {}
    for i = 1, #input do
        local char = string.byte(input, i)
        local encryptedChar = bit32.bxor(char, key) -- XOR операция с использованием ключа
        table.insert(result, string.char(encryptedChar))
    end
    return table.concat(result)
end

-- Функция для обфускации
function obfuscate(code)
    local key = 123 -- Ваш ключ для шифрования
    local obfuscatedCode = xorEncryptDecrypt(code, key)
    
    -- Копируем зашифрованный код в буфер обмена (замените на вашу реализацию)
    setclipboard(obfuscatedCode)
    
    -- Печатаем зашифрованный код в консоль
    print("Обфусцированный код:", obfuscatedCode)
    return obfuscatedCode -- Возвращаем зашифрованный код
end

-- Функция для получения расшифрованного кода
function getdecrypted(encodedCode)
    local key = 123 -- Ваш ключ для расшифровки
    local decryptedCode = xorEncryptDecrypt(encodedCode, key)
    
    -- Выполнение расшифрованного кода
    local func, err = loadstring(decryptedCode)
    if func then
        func()
    else
        print("Ошибка при выполнении:", err)
    end
end

return { obfuscate = obfuscate, getdecrypted = getdecrypted }
