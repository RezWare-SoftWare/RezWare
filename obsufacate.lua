local customKey = {
    a = "1", b = "2", c = "3", d = "4", e = "5",
    f = "6", g = "7", h = "8", i = "9", j = "0",
    k = "!", l = "@", m = "#", n = "$", o = "%",
    p = "^", q = "&", r = "*", s = "(", t = ")",
    u = "-", v = "_", w = "+", x = "=", y = "[", z = "]",
    [" "] = " "
}

local reverseKey = {}
for k, v in pairs(customKey) do
    reverseKey[v] = k
end

-- Функция для кастомного шифрования
function obfuscate(code)
    local encrypted = {}
    for i = 1, #code do
        local char = code:sub(i, i)
        table.insert(encrypted, customKey[char] or char) -- Заменяем символы
    end
    local obfuscatedCode = table.concat(encrypted)
    
    -- Копируем зашифрованный код в буфер обмена
    setclipboard(obfuscatedCode)
    
    print("Обфусцированный код:", obfuscatedCode)
    return obfuscatedCode -- Возвращаем зашифрованный код
end

-- Функция для кастомного расшифрования
function getdecrypted(encodedCode)
    local decrypted = {}
    for i = 1, #encodedCode do
        local char = encodedCode:sub(i, i)
        table.insert(decrypted, reverseKey[char] or char) -- Обратная замена
    end
    local decryptedCode = table.concat(decrypted)

    -- Выполнение расшифрованного кода
    local func, err = loadstring(decryptedCode)
    if func then
        func()
    else
        print("Ошибка при выполнении:", err)
    end
end
