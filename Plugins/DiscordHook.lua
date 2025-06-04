ThreadSpeed = 60000; -- Set the thread speed to 60 seconds
Owner = "Lokiagent";
Name = "DiscordHook";
Github = "https://github.com/Lokiagent/WEPW-Questing/Plugins/DiscordHook.lua";
Player = GetPlayer();
-- Define the discordWebhook module
local discordWebhook = {}
-- Set the URL and avatar
local url = "<Discord Webhook URL>"
local avatar = "https://img.freepik.com/free-vector/capybara-love-logo_7688-559.jpg"

function discordWebhook.setURL(value)
    url = value
end

function discordWebhook.setAvatar(value)
    avatar = value
end

-- Create an embed object
function discordWebhook.createEmbed(data)

    local embed = data or {} -- Embed table: title, description, color, timestamp

    function embed.setImage(value)
        data.image = { url = value }
    end

    function embed.setThumbnail(value)
        data.thumbnail = { url = value }
    end

    function embed.setFooter(value)
        data.footer = value
    end

    function embed.setAuthor(value)
        data.author = value
    end

    function embed.addFields(...)
        data.fields = { ... }
    end

    return embed
end

-- Create a timestamp
function discordWebhook.timestamp(value)
    return os.date("!%Y-%m-%dT%H:%M:%S", value)
end

-- Add a new function to the discordWebhook module
function discordWebhook.file(value)
    -- Read the contents of the file as a byte array
    local file = io.open(value, "rb")
    local contents = file:read("*all")
    file:close()
    -- Return the file contents
    return contents
end

-- Create the Body
function discordWebhook.createBody(data)
    data = data or {}   -- Body table: username, content, embed, [file]
    return data
end

-- Send the webhook
function discordWebhook.send(...)
    local webhookURL, Body, method

    if select('#', ...) == 1 then

        -- If the only argument is type 'table', it must be Body table!
        if type(select(1, ...)) == "table" then
            Body = select(1, ...)
        else

            -- Else, the type is 'string' as messages inside content
            Body = {
                content = select(1, ...)
            }
        end
    else
        -- Otherwise, unpack the arguments as normal
        webhookURL, Body, method = table.unpack{...}
    end

    local webhookURL = webhookURL or url
    local avatar_url = Body.avatar_url or avatar
    local method = method or false

    local script =  [[$webHookUrl = "]]..webhookURL..[["
    ]]

    -- if Body.file then
    --     script = script.. [[
    --     $filePath = "]]..Body.file..[["
    --     $fileContent = Get-Content -Path $filePath -Encoding Byte
    -- ]]
    -- end

    if Body.embed then
        local fieldArray = ""
        local author = ""
        local footer = ""
        local thumbnail = ""

        if Body.embed.fields then
            for index, values in ipairs(Body.embed.fields) do
                fieldArray = fieldArray..[[@{name = ']]..values.name..[['; value = ']]..values.value..[[';inline = ']]..tostring(values.inline)..[['};]]
            end
        end

        if Body.embed.author then
            for key, value in pairs(Body.embed.author) do
                author = author..[[
                    
                ]]..key.." = '"..value..[['
                ]]
            end
        end

        if Body.embed.thumbnail then
            thumbnail = [[
                
            url = ']]..Body.embed.thumbnail.url .. [['
            ]]
        end

        if Body.embed.footer then
            for key, value in pairs(Body.embed.footer) do
                footer = footer..[[
    
                ]]..key..[[ = ']]..value..[['
                ]]
            end
        end

        if Body.embed.color then 
            script = script..[[
            $color = "]].. Body.embed.color ..[["
            ]]
        end

        if Body.embed.title then 
            script = script..[[
            $title = "]]..Body.embed.title..[["
            ]]
        end

        if Body.embed.description then 
            script = script..[[
            $description = "]]..Body.embed.description..[[" 
            ]]
        end

        if Body.embed.timestamp then 
            script = script..[[
            $timestamp = ']].. Body.embed.timestamp ..[['
            ]]
        end

        if thumbnail ~= "" then
            script = script..[[ 
                $thumbnail = @{]].. thumbnail ..[[}
            ]]
        end

        script = script..[[ 
            $author = @{]].. author ..[[} 
            $footer = @{]]..footer..[[}
            $fieldArray = @(]].. fieldArray ..[[)
        ]]

        -- STARTI OF EMBED OBJECT
        script = script..[[
            $embedObject = @{
                color = $color
                title = $title
                description = $description
                timestamp = $timestamp
                footer = $footer
                fields = $fieldArray
                author = $author
        ]]

        if thumbnail ~= "" then
            script = script..[[ 
                thumbnail = $thumbnail
            ]]
        end
        
        -- if author ~= "" then
        --     script = script..[[ 
        --         author = $author
        --     ]]
        -- end

        -- END OF EMBED OBJECT!
        script = script..[[
        }
                
        $embedArray = New-Object System.Collections.Generic.List[Object]
        $embedArray.Add($embedObject)
        ]]
    end

    if Body.embeds and #Body.embeds > 0 then
        -- Build PowerShell embed array
        script = script..[[
$embedArray = @()
]]
        for i, embed in ipairs(Body.embeds) do
            script = script..[[
$embedObject = @{
    title = "]]..(embed.title or "")..[["
    description = "]]..(embed.description or "")..[["
    color = "]]..(embed.color or "")..[["
    timestamp = "]]..(embed.timestamp or "")..[["
}
$embedArray += $embedObject
]]
        end
        script = script..[[
]]
    end

    script = script..[[
    $payload = @{ 
    ]]

    if Body.username then
        script = script..[[
        username = "]].. Body.username ..[["
        ]]
    end

    if avatar_url then
        script = script..[[
    avatar_url = "]].. avatar_url ..[["
        ]]
    end

    if Body.content then
        script = script..[[
    content = "]]..Body.content..[["     
        ]]
    end

    -- if Body.file then
    --     script = script..[[
    --     file_name = "]]..Body.file_name..[["
    --         file_type = "]]..Body.file_type..[["
    --         file_contents = ']].. Body.file ..[['
    --     ]]
    -- end

    if Body.embed then
        script = script..[[
    embeds = $embedArray
        ]]
    end

    if Body.embeds and #Body.embeds > 0 then
        script = script..[[
    embeds = $embedArray
        ]]
    end

    script = script.."}\n"

    if method then
        script = script.."\n"..[[
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
    ]]
    else
        script = script.."\n"..[[
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
    ]]
    end

    local file = io.open("log.ps1", "w")
    file:write(script)
    file:close()

    --local pipe = io.popen("powershell -command -", "w")
    --pipe:write(script)
    --pipe:close()
    os.execute("powershell.exe -ExecutionPolicy Bypass -File log.ps1")
end

function sendDiscordStatus()
    if CurrentLevel == nil then
        CurrentLevel = GetPlayer().Level
    else
        local CheckLevel = GetPlayer().Level
        if CheckLevel > CurrentLevel then
            str = discordWebhook.createBody({
                username = GetWEPWUser(),
                content = "Player has leveled up!",
                embed = discordWebhook.createEmbed({
                    title = "Level Up!",
                    description = "DING!",
                    color = 0x00FF00, 
                    timestamp = discordWebhook.timestamp(os.time()),
                 })
             })
          end
    end
    if GetPlayer().PlayerFlag == "Afk" then
        str = discordWebhook.createBody({
            username = GetWEPWUser(),
            content = ("Player %s is currently AFK. Level: %d"):format(Player.Name, Player.Level),
            embed = discordWebhook.createEmbed({
                title = "AFK Status",
                description = "The player is currently AFK.",
                color = 0xFF0000, -- Red color
                timestamp = discordWebhook.timestamp(os.time()),
            })
        })
    end
    if Player.PlayerFlag == "PlayedTooLong" or Player.PlayerFlag == "PlayedLongTime" then
        str = discordWebhook.createBody({
            username = GetWEPWUser(),
            content = ("Player %s has played for too long. Level: %d"):format(Player.Name, Player.Level),
            embed = discordWebhook.createEmbed({
                title = "Played Too Long Status",
                description = "The player has played for too long.",
                color = 0xFF0000, -- Red color
                timestamp = discordWebhook.timestamp(os.time()),
            })
        })
    end
    -- Only send the default message every 10 minutes
--    if  minutes >= 10 then
--        str = discordWebhook.createBody({
--            username = GetWEPWUser(),
--            content = ("Current Player: %s, Level: %d"):format(Player.Name, Player.Level),
--            embed = discordWebhook.createEmbed({
--                title = "Current BOT State",
--                description = "The Bot is currently in the state: " .. GetBOTState(),
--                color = 0x00FF00, -- Green color
--                timestamp = discordWebhook.timestamp(now),
--            })
--        })
--        minutes = 0
--    end

    -- Always check and send bag space warning if needed
    if FreeBagSpace() < 3 then
        str = discordWebhook.createBody({
            username = GetWEPWUser(),
            content = "The Bot has less than 3 free bag slots.",
            embed = discordWebhook.createEmbed({
                title = "Inventory Status",
                description = "The Bot has less than 3 free bag slots.",
                color = 0xFFFF00, -- Yellow color
                timestamp = discordWebhook.timestamp(now),
            })
        })
    end

    -- Always check and send stuck warning if needed
    if GetStuckTime() > 1000 then
        str = discordWebhook.createBody({
            username = GetWEPWUser(),
            content = "The Bot has been stuck for more than 1000 milliseconds.",
            embed = discordWebhook.createEmbed({
                title = "Stuck Status",
                description = "The Bot has been stuck for more than 1000 milliseconds.",
                color = 0xFFA500, -- Orange color
                timestamp = discordWebhook.timestamp(now),
            })
        })
    end

    -- Only send if str is set (i.e., a message needs to be sent)
    if str then
        discordWebhook.send(url, str)
    end
--    if minutes == nil then
--        minutes = 0
--    else
--        minutes = minutes + 1
--    end
--    Log("Minutes until next status update: " .. (10 - minutes))
    -- Reset the str variable to nil after sending
    str = nil
end

-- Replace your current logic with a call to sendDiscordStatus()
sendDiscordStatus()