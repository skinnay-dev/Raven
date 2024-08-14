local MOD = Raven
local SHIM = MOD.SHIM

-- C_Container
function SHIM:GetContainerItemID(bag, slot)
	if _G.C_Container.GetContainerItemID ~= nil then
		return C_Container.GetContainerItemID(bag, slot)
	end

	return GetContainerItemID(bag, slot)
end

function SHIM:GetContainerNumSlots(bag)
	if _G.C_Container.GetContainerNumSlots ~= nil then
		return C_Container.GetContainerNumSlots(bag)
	end

	return GetContainerNumSlots(bag)
end

-- C_CurrencyInfo
function SHIM:GetCoinTextureString(amount)
	if _G.C_CurrencyInfo.GetCoinTextureString ~= nil then
		return C_CurrencyInfo.GetCoinTextureString(amount)
	end

	return GetCoinTextureString(amount)
end

-- C_Item
function SHIM:GetItemCooldown(item)
	-- Retail
	if _G.C_Item.GetItemCooldown ~= nil then
		return C_Item.GetItemCooldown(item)
	end

	-- Classic
	if _G.C_Container.GetItemCooldown ~= nil then
		return C_Container.GetItemCooldown(item)
	end

	-- Wrath
	return GetItemCooldown(item)
end

function SHIM:GetItemCount(item, includeBank, includeCharges)
	if _G.C_Item.GetItemCount ~= nil then
		return C_Item.GetItemCount(item, includeBank, includeCharges)
	end

	return GetItemCount(item, includeBank, includeCharges)
end

function SHIM:GetItemIconByID(itemID)
	if _G.C_Item.GetItemIconByID ~= nil then
		return C_Item.GetItemIconByID(itemID)
	end

	return GetItemIcon(itemID)
end

function SHIM:GetItemInfo(itemID)
	if _G.C_Item.GetItemInfo ~= nil then
		return C_Item.GetItemInfo(itemID)
	end

	return GetItemInfo(itemID)
end

function SHIM:GetItemSpell(itemID)
	if _G.C_Item.GetItemSpell ~= nil then
		return C_Item.GetItemSpell(itemID)
	end

	return GetItemSpell(itemID)
end

function SHIM:IsUsableItem(item)
	if _G.C_Item.IsUsableItem ~= nil then
		return C_Item.IsUsableItem(item)
	end

	return IsUsableItem(item)
end

function SHIM:GetSpellInfo(spellID)
    if _G.C_Spell.GetSpellInfo ~= nil then
        local info = C_Spell.GetSpellInfo(spellID)

        if info == nil then
            return nil
        end

        return info.name,
            nil, -- rank
            info.iconID,
            info.castTime,
            info.minRange,
            info.maxRange,
            info.spellID
    end

    return GetSpellInfo(spellID)
end

function SHIM:GetNumSpellTabs()
    if _G.C_SpellBook.GetNumSpellBookSkillLines ~= nil then
        return C_SpellBook.GetNumSpellBookSkillLines()
    end

    return GetNumSpellTabs()
end

function SHIM:GetSpellTabInfo(tabIndex)
    if _G.C_SpellBook.GetSpellBookSkillLineInfo ~= nil then
        local info = C_SpellBook.GetSpellBookSkillLineInfo(tabIndex)

        return info.name,
            info.iconID,
            info.itemIndexOffset,
            info.numSpellBookItems,
            info.isGuild,
            info.shouldHide,
            info.specID,
            info.offSpecID
    end

    return GetSpellTabInfo(tabIndex)
end

function SHIM:GetSpellBookItemName(index, bookType)
    if _G.C_SpellBook.GetSpellBookItemName ~= nil then
        if bookType == "spell" then
            bookType = Enum.SpellBookSpellBank.Player
        elseif bookType == "pet" then
            bookType = Enum.SpellBookSpellBank.Pet
        end

        return C_SpellBook.GetSpellBookItemName(index, bookType)
    end

    return GetSpellBookItemName(index, bookType)
end

function SHIM:GetSpellBookItemInfo(index, bookType)
    if _G.C_SpellBook.GetSpellBookItemInfo ~= nil then
        if bookType == "spell" then
            bookType = Enum.SpellBookSpellBank.Player
        elseif bookType == "pet" then
            bookType = Enum.SpellBookSpellBank.Pet
        end

        local info = C_SpellBook.GetSpellBookItemInfo(index, bookType)

        if info == nil then
            return nil
        end

        local spellID = info.actionID

        local itemType = "UNKNOWN"
        if info.itemType == Enum.SpellBookItemType.Spell then
            itemType = "SPELL"
        elseif info.itemType == Enum.SpellBookItemType.None then
            itemType = "NONE"
        elseif info.itemType == Enum.SpellBookItemType.Flyout then
            itemType = "FLYOUT"
        elseif info.itemType == Enum.SpellBookItemType.FutureSpell then
            itemType = "FUTURESPELL"
        elseif info.itemType == Enum.SpellBookItemType.PetAction then
            itemType = "PETACTION"
            spellID = bit.band(0xFFFFFF, info.actionID)
        end

        local spellOverrideID
        if info.spellID ~= nil and info.spellID ~= spellID then
            spellOverrideID = info.spellID
        end

        return itemType, spellID, info.isPassive, spellOverrideID
    end

    local itemType, spellID = GetSpellBookItemInfo(index, bookType)
    if itemType == "PETACTION" then
        spellID = bit.band(0xFFFFFF, spellID)
    end

    return itemType, spellID, IsPassiveSpell(spellID)
end

function SHIM:HasPetSpells()
    if _G.C_SpellBook.HasPetSpells ~= nil then
        return C_SpellBook.HasPetSpells()
    end

    return HasPetSpells()
end

function SHIM:GetSpellTexture(spellID)
    if _G.GetSpellTexture == nil then
        local info = C_Spell.GetSpellInfo(spellID)

        if info == nil then
            return nil
        end

        return info.iconID
    end

    return GetSpellTexture(spellID)
end

function SHIM:GetSpellCooldown(spellID)
    if _G.C_Spell.GetSpellCooldown ~= nil then
        local info = C_Spell.GetSpellCooldown(spellID)

        if info == nil then
            return nil
        end

        local isEnabled = 1
        if not info.isEnabled then
            isEnabled = 0
        end

        return info.startTime,
            info.duration,
            isEnabled,
            info.modRate
    end

    return GetSpellCooldown(spellID)
end

function SHIM:GetSpellBookItemCooldown(index, spellBank)
    if _G.C_SpellBook.GetSpellBookItemCooldown ~= nil then
        if spellBank == "spell" then
            spellBank = Enum.SpellBookSpellBank.Player
        end

        local info = C_SpellBook.GetSpellBookItemCooldown(index, spellBank)

        if info == nil then
            return nil
        end

        return info.startTime,
            info.duration,
            info.isEnabled,
            info.modRate
    end

    return GetSpellCooldown(index, spellBank)
end

function SHIM:IsUsableSpell(spell)
    if _G.C_Spell.IsSpellUsable ~= nil then
        return C_Spell.IsSpellUsable(spell)
    end

    return IsUsableSpell(spell)
end

function SHIM:GetSpellCharges(index, book)
    if _G.C_SpellBook.GetSpellBookItemCharges ~= nil then
        if book == "spell" then
            book = Enum.SpellBookSpellBank.Player
        elseif book == "pet" then
            book = Enum.SpellBookSpellBank.Pet
        end

        local info = C_SpellBook.GetSpellBookItemCharges(index, book)

        if info == nil then
            return nil
        end

        return info.currentCharges,
            info.maxCharges,
            info.cooldownStartTime,
            info.cooldownDuration,
            info.chargeModRate
    end

    return GetSpellCharges(index, book)
end

function SHIM:GetSpellChargesByID(spellID)
    if _G.C_Spell.GetSpellCharges ~= nil then
        local info = C_Spell.GetSpellCharges(spellID)

        if info == nil then
            return nil
        end

        return info.currentCharges,
            info.maxCharges,
            info.cooldownStartTime,
            info.cooldownDuration,
            info.chargeModRate
    end

    return GetSpellCharges(spellID)
end
