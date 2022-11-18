-- Evoker

Raven.classConditions.EVOKER = {
	["Naturalize (Poison)"] = {
		tests = {
			["Spell Ready"] = { enable = true, spell = 360823, }, -- "Naturalize"
			["Debuff Type"] = { enable = true, unit = "player", hasDebuff = "Poison", },
		},	
		associatedSpell = 360823, -- "Naturalize"
	},
	["Naturalize (Magic)"] = {
		tests = {
			["Spell Ready"] = { enable = true, spell = 360823, }, -- "Naturalize"
			["Debuff Type"] = { enable = true, unit = "player", hasDebuff = "Magic", },
		},	
		associatedSpell = 360823, -- "Naturalize"
	},
}
