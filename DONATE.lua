local Market = game:GetService("MarketplaceService")
local HTTPService = game:GetService("HttpService")

local BoothName = nil

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EventsFolder = ReplicatedStorage:FindFirstChild("Events")

local Bindable = EventsFolder:FindFirstChild("ClaimPlot")

local SubCategories = {
    "2";
    "11";
    "12"
}

local function GetContent(boothname, username, userid)
    for i = 1, 3 do
        local Contents = {}
        local cursor = cursor or ""

        local Url = "https://catalog.roproxy.com/v1/search/items/details?Category=3&Subcategory=".. SubCategories[i].. "&Sort=4&Limit=30&CreatorName=%s&cursor=%s"
        local requestUrl = Url:format(username, cursor)

        task.wait(3)
        local success, result = pcall(function()
            return HTTPService:GetAsync(requestUrl, true)
        end)

        if success then
            if result then
                local success2, result2 = pcall(function()
                    return HTTPService:JSONDecode(result)
                end)
                if not success then
                    if not result then
                        return GetContent(boothname, username, userid)
                    end
                end
            end
        end
    end
end

-- DataStore2 data
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Datastore2 = require(ReplicatedStorage.Modules.MainModule)
Datastore2.Combine("DATA", "Donated", "Raised")

Players.PlayerAdded:Connect(function(plr)
    local DonatedStore = Datastore2("Donated", plr) 
    local RaisedStore = Datastore2("Raised", plr)

    local Leaderstats = Instance.new("Folder")
    Leaderstats.Name = 'leaderstats'

    local Donated = Instance.new("IntValue", Leaderstats)
    Donated.Value = DonatedStore:Get(0)
    Donated.Name = "Donated"

    local Raised = Instance.new("IntValue", Leaderstats)
    Raised.Name = "Raised"
    Raised.Value = RaisedStore:Get(0)

    DonatedStore:OnUpdate(function(NewDonated)
        Donated.Value = NewDonated
    end)

    RaisedStore:OnUpdate(function(NewRaised)
        Raised.Value = NewRaised
    end)

    Leaderstats.Parent = plr
end)

-- Particles and purchases handling
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStore2 = require(ReplicatedStorage.Modules.MainModule)
local Players = game:GetService("Players")

MarketplaceService.PromptPurchaseFinished:Connect(function(player, assetId, isPurchased)
    if isPurchased then
        -- Handle purchase
    end
end)