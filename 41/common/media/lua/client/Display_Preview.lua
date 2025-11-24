PatchInspect = ISCollapsableWindow:derive("PatchInspect")
PatchInspect.windows = {}

FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.NewSmall)

function PatchInspect:close()
    self:removeFromUIManager()
    for i, win in ipairs(PatchInspect.windows) do
        if win == self then
            table.remove(PatchInspect.windows, i)
            break
        end
    end
end

function PatchInspect:render()
    ISCollapsableWindow.render(self)

    if self.texture then
        local texWidth = self.width - 2
        local texHeight = self.height + 2 - FONT_HGT_SMALL * 2
        self:drawTextureScaled(self.texture, 1, FONT_HGT_SMALL+1, texWidth, texHeight, 1, 1, 1, 1)
    end
end

function PatchInspect.ShowWindow(num)
    local window = PatchInspect:new(200, 125, 200 + 2, 125 + FONT_HGT_SMALL * 2 - 2)
    window.title = getText("IGUI_PatchPreview" .. tostring(num))
    window.texture = getTexture("media/textures/Clothes/MoralePatches/Patch_" .. string.format("%03d", num) .. ".png")
    window:initialise()
    window:addToUIManager()
    table.insert(PatchInspect.windows, window)
end

function PatchInspect.HideWindow(window)
    if window then
        window:close()
    end
end
