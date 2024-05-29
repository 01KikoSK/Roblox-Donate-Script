-- Skript Donate Button
local donateButton = script.Parent -- predpokladáme, že tlačidlo je priamo pod skriptom

-- Funkcia pre spracovanie kliknutia na tlačidlo
local function onDonateClicked()
    local player = game.Players.LocalPlayer
    local amount = 100 -- suma, ktorú chcete darovať

    -- Vytvorenie Developer Productu na darovanie
    -- Musíte nastaviť svoj vlastný Developer Product ID
    local productId = 00000000 

    -- Výzva na darovanie
    marketService:PromptProductPurchase(player, productId)
end

-- Pripojenie udalosti kliknutia na tlačidlo
donateButton.MouseButton1Click:Connect(onDonateClicked)
