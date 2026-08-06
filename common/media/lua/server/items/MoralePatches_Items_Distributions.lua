require "Items/ProceduralDistributions"

local patchDistributions = {
    ArmySurplusOutfit = {
        items = {
            "MoralePatches.MoralePatch_LS", 2,
        }
    },
    ArmySurplusMisc = {
        items = {
            "MoralePatches.MoralePatch_LS", 2,
        }
    },
    DresserGeneric = {
        items = {
            "MoralePatches.MoralePatch_LS", 2,
        }
    },
    WardrobeGeneric = {
        items = {
            "MoralePatches.MoralePatch_LS", 2,
        }
    }
}

local ProceduralDistributions_list = ProceduralDistributions.list
local table_insert = table.insert

local function insertInDistribution(distrib)
    for containerName, data in pairs(distrib) do
        local targetContainer = ProceduralDistributions_list[containerName]
        if targetContainer then
            local itemsToInsert = data.items
            local targetItems = targetContainer.items
            if itemsToInsert and targetItems then
                for i = 1, #itemsToInsert do
                    table_insert(targetItems, itemsToInsert[i])
                end
            end
        end
    end
end

insertInDistribution(patchDistributions)