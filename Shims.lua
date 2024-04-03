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
