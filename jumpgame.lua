
--Private Variables
local finished = true
local button_speed = 15
local button_refresh_rate = 80
local button_left_border = 825
local button_right_border = 1050
local button_top_border = 400
local button_bottom_border = 600

-- public functions

--Initialization Method for Binding Cleanup Events
function init()
    connect(g_game, {
        onGameEnd = offline
    })
end

--Toggles UI Visibility - Tied to User Input (See gameinterface.lua)
function show()
    finished = false

    jumpGame = g_ui.displayUI('jumpgame')

    jumpGameButton = jumpGame:getChildById('jumpbutton')

    resetButton() --Sets initial button position

    --Bind Click Event to Button Reset
    jumpGameButton.onClick = function() 
        resetButton()
    end

    animateButton()

    --Add User Input for Closing Window
    g_keyboard.bindKeyDown('J', function()
        hide()
    end, jumpGame)
end

--Sets UI Visibility to false
function hide()
    jumpGame:hide()
    finished = true
end

--Cleanup method called when Unloading
function terminate()
    hide()
    disconnect(g_game, {
        onGameEnd = offline
    })
    jumpGame:destroy()
end

--Animation Method
function animateButton()
    --Base Case
    if not finished and jumpGameButton then
        --Check Button X Position Against Left-most Edge
        if jumpGameButton:getX() <= button_left_border then
            resetButton()
        end

        --Slowly Crawl Across the Screen
        jumpGameButton:setX(jumpGameButton:getX() - button_speed)
    else
        return true
    end
    scheduleEvent(animateButton, button_refresh_rate)
end

--Reset X coordinate of button and Randomize Y coordinate within range
function resetButton()
    jumpGameButton:setX(button_right_border)
    jumpGameButton:setY(math.random(button_top_border, button_bottom_border))
end

--Additional Cleanup Method for handling mid-JumpGame logouts
function offline()
    g_keyboard.unbindKeyDown('J', jumpGame)
    hide()
end
