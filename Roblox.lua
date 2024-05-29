-- Variables
local amount = 100 -- Donation amount
local player = game.Players.LocalPlayer -- Local player
local teamId = 123456 -- Team ID to donate to

-- Button click detection
script.Parent.Button.MouseButton1Click:Connect(function()
    -- Check team membership
    if player.TeamId == teamId then
        -- Verify player's funds
        if player.Cash >= amount then
            -- Deduct donation amount
            player.Cash -= amount

            -- Increment team's funds
            game.Teams[teamId].Cash += amount

            -- Provide successful donation feedback
            print("Donation successful!")
        else
            -- Insufficient funds feedback
            print("Insufficient funds to donate.")
        end
    else
        -- Not in team feedback
        print("You must be in Team "..teamId.." to donate.")
    end
end)
