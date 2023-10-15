local config = require('MechanicsRemastered.config')

-- Spellcasting Overhaul

local function spellSuccessChance(skill, willpower, luck, cost, sound, fatigue, maxFatigue)
    return ((skill * 2) + (willpower / 5) + (luck / 10) - cost - sound) * (0.75 + (0.5 * (fatigue / maxFatigue)))
end

local function schoolToSkill(school)
    if (school == tes3.magicSchool.alteration) then
        return tes3.skill.alteration
    end
    if (school == tes3.magicSchool.conjuration) then
        return tes3.skill.conjuration
    end
    if (school == tes3.magicSchool.destruction) then
        return tes3.skill.destruction
    end
    if (school == tes3.magicSchool.illusion) then
        return tes3.skill.illusion
    end
    if (school == tes3.magicSchool.mysticism) then
        return tes3.skill.mysticism
    end
    if (school == tes3.magicSchool.restoration) then
        return tes3.skill.restoration
    end
    if (school == tes3.magicSchool.none) then
        return -1
    end
end

local function costForMobileActor(spell, cost, caster)
    local spellSchool = spell:getLeastProficientSchool(caster)
    if (spellSchool >= 0) then
        local spellSkill = schoolToSkill(spellSchool)
        local spellCost = cost
        
        -- Calculate everything to determine the chance of success.
        local skill = caster:getSkillValue(spellSkill)
        local willpower = caster.willpower.current
        local luck = caster.luck.current
        local fatigue = caster.fatigue.current
        local maxFatigue = caster.fatigue.base
        local sound = caster.sound
        local cost = spell.magickaCost
        local successChance = spellSuccessChance(skill, willpower, luck, cost, sound, fatigue, maxFatigue)

        -- Limit the success chance from 0 - 100
        if (successChance > 100) then
            successChance = 100
        end
        if (successChance < 0) then
            successChance = 0
        end

        -- Adjust the cost of the spell by the modifier
        local costModifier = 100 / successChance
        local newCost = cost * costModifier
        return math.floor(newCost+0.5)
    end
    return cost
end

--- @param e spellMagickaUseEventData
local function spellMagickaUseCallback(e)
    local success = e.spell.alwaysSucceeds
    -- If this spell would succeed anyway, do nothing.
    if (config.SpellcastEnabled == true and success == false) then
        local spell = e.spell
        local cost = e.cost
        local caster = e.caster.mobile
        local newCost = costForMobileActor(spell, cost, caster)
        e.cost = newCost
    end
end

--- @param e spellCastEventData
local function spellCastCallback(e)
    if (config.SpellcastEnabled == true) then
        if (e.castChance > 0) then
            e.castChance = 100
        end
    end
end

local function updateMagicMenu(e)
    if (config.SpellcastEnabled == true) then
        local magicMenu = tes3ui.findMenu("MenuMagic")
        if (not magicMenu) then
            return
        end

        local spellNameList = magicMenu:findChild("MagicMenu_spell_names")
        local spellCostList = magicMenu:findChild("MagicMenu_spell_costs")
        local spellPercentList = magicMenu:findChild("MagicMenu_spell_percents")
        local playerSpells = tes3.mobilePlayer.object.spells
        local player = tes3.mobilePlayer

        for ix, nameElement in ipairs(spellNameList.children) do
            local listSpell = nameElement:getPropertyObject("MagicMenu_Spell")
            local newCost = costForMobileActor(listSpell, listSpell.magickaCost, player)
            local roundedCost = tostring(newCost)
            spellCostList.children[ix].text = ""
            spellPercentList.children[ix].text = roundedCost .. ""
        end
        magicMenu:findChild("MagicMenu_spell_cost_title").text = "Cost"
    end
end

--- @param e uiActivatedEventData
local function uiActivatedCallback(e)
    e.element:registerAfter("preUpdate", updateMagicMenu)
end

event.register(tes3.event.uiActivated, uiActivatedCallback, { filter = "MenuMagic" })
event.register(tes3.event.spellCast, spellCastCallback)
event.register(tes3.event.spellMagickaUse, spellMagickaUseCallback)
mwse.log(config.Name .. ' Spellcasting Module Initialised.')