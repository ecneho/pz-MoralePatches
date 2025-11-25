---@param item InventoryItem
local function DisplayPreview(_, item)
    local index = item:getVisual():getTextureChoice();
    PatchInspect.ShowWindow(index+1);
end

local function OnFillInventoryObjectContextMenu(playerNum, context, items)
    local player = getSpecificPlayer(playerNum)
    local items = ISInventoryPane.getActualItems(items)
    local added = false

    for _, item in ipairs(items) do
        if item:getFullType() == 'MoralePatches.MoralePatch' and not added then
            context:addOption(
                getText('IGUI_InspectPatch'),
                player,
                DisplayPreview,
                item
            )
            added = true
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(OnFillInventoryObjectContextMenu)
