Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}

local function generateRecipes(amount)
    for i = 1, amount do
        local functionName = "EmbroiderPatch" .. i

        Recipe.OnCreate[functionName] = function(_, character)
            ---@type InventoryItem
            local patch = instanceItem("MoralePatches.MoralePatch_LS")
            patch:getVisual():setTextureChoice(i-1)
            character:getInventory():DoAddItem(patch)
            patch:synchWithVisual()
        end
    end
end

generateRecipes(100)