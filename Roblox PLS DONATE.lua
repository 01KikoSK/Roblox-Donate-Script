-- Services
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- Variables
local DONATION_AMOUNT = 10 -- The amount of Robux to donate
local DONATION_MESSAGE = "Thanks for the donation!" -- The message to display to the player after donating

-- Function to process the donation
local function processDonation(player)
    -- Check if the player has enough Robux
    if player.Robux >= DONATION_AMOUNT then
        -- Deduct the donation amount from the player's Robux balance
        player.Robux = player.Robux - DONATION_AMOUNT
        -- Display a message to the player
        game.StarterGui:SetCore("ChatMessage", {
            Text = DONATION_MESSAGE,
            Color = Color3.new(0, 1, 0),
        })
        -- Add your own code here to handle the donation, such as giving the player a special item or perk
    else
        -- Display a message to the player
        game.StarterGui:SetCore("ChatMessage", {
            Text = "You don't have enough Robux to donate.",
            Color = Color3.new(1, 0, 0),
        })
    end
end

-- Listen for player donations
MarketplaceService.ProcessReceipt = function(receiptInfo)
    -- Get the player who made the donation
    local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
    if player then
        -- Process the donation
        processDonation(player)
    end
end