
--Area definition matrix (see Question 5 video)
local AREA_CIRCLE = {
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 1, 0, 1, 0, 1, 0},
	{1, 0, 1, 2, 1, 0, 1},
	{0, 1, 0, 1, 0, 1, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}

--Standard Tibia Magic Damage Calculation (Taken from other base spells)
function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

--Callback Method for each Tile (Based on apocalypse base spell)
function spellCallback(cid, position, count)
	--Randomized Tornado Spawn (Mainly affects small tornados)
	if count > 0 or math.random(0, 1) == 1 then
		position:sendMagicEffect(CONST_ME_ICETORNADO)
	end

	--Sets Recurse count, Aimed to replicate video timings
	if count < 3 then
		count = count + 1
		addEvent(spellCallback, math.random(700, 1000), cid, position, count)
	end
end

--Combat System Event Handler, Called at each Tile Position Defined in Combat Area
function onTargetTile(creature, position)
	spellCallback(creature:getId(), position, 0)
end

--Combat Parameter and Callback Setup
local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE))
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

--Spell Cast Event Entry Point
function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant) --Utilizing TFS Combat System
end
