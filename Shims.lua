local MOD = Raven
local SHIM = MOD.SHIM

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

function SHIM:GetContainerNumSlots(bag)
	if _G.C_Container.GetContainerNumSlots ~= nil then
		return C_Container.GetContainerNumSlots(bag)
	end

	return GetContainerNumSlots(bag)
end

function SHIM:GetContainerItemID(bag, slot)
	if _G.C_Container.GetContainerItemID ~= nil then
		return C_Container.GetContainerItemID(bag, slot)
	end

	return GetContainerItemID(bag, slot)
end

function SHIM:GetItemCooldown(item)
	if _G.C_Item.GetItemCooldown ~= nil then
		return C_Item.GetItemCooldown(itemID)
	end

	return GetItemCooldown(itemID)
end

function SHIM:IsUsableItem(item)
	if _G.C_Item.IsUsableItem ~= nil then
		return C_Item.IsUsableItem(item)
	end

	return IsUsableItem(item)
end

function SHIM:GetItemIcon(itemID)
	if _G.C_Item.GetItemIcon ~= nil then
		return C_Item.GetItemIcon(itemID)
	end

	return GetItemIcon(itemID)
end

function SHIM:GetItemCount(item, includeBank, includeCharges)
	if _G.C_Item.GetItemCount ~= nil then
		return C_Item.GetItemCount(item, includeBank, includeCharges)
	end

	return GetItemCount(item, includeBank, includeCharges)
end

function SHIM:GetCoinTextureString(amount)
	if _G.C_CurrencyInfo.GetCoinTextureString ~= nil then
		return C_Item.C_CurrencyInfo.GetCoinTextureString(amount)
	end

	return GetCoinTextureString(amount)
end
