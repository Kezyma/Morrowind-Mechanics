local config = require('MechanicsRemastered.config')

-- Combat Overhaul

local combatHitChance = nil
local combatRatioSkill = false
local combatUndetected = false
local combatGodMode = false

--- @param e calcHitChanceEventData
local function calcHitChanceCallback(e)
    if (config.CombatEnabled == true) then
        -- Record the hit chance for this attack.
        combatHitChance = e.hitChance
        -- Return 100 for a guaranteed hit, unless chance is 0.
        if (e.hitChance > 0) then
            e.hitChance = 100
        end

        -- Set a flag to know when to reduce exp gain. 
        combatRatioSkill = true
    end
end

--- @param e detectSneakEventData
local function detectSneakCallback(e)
    if (config.CombatEnabled == true) then
        combatUndetected = e.isDetected == false
    end
end

--- @param e damageEventData
local function damageCallback(e)
    if (config.CombatEnabled == true and e.source == 'attack') then
        -- Modify the damage based on the hit chance.
        if (combatHitChance > 0) then
            e.damage = (e.damage * combatHitChance) / 100
        else 
            e.damage = 0
        end
    end
end

--- @param e damageHandToHandEventData
local function damageHandToHandCallback(e)
    if (config.CombatEnabled == true) then
        -- Modify the damage based on the hit chance.
        if (combatHitChance > 0) then
            e.fatigueDamage = (e.fatigueDamage * combatHitChance) / 100
        else 
            e.fatigueDamage = 0
        end
    end
end


--- @param e exerciseSkillEventData
local function exerciseSkillCallback(e)
    if (config.CombatEnabled == true and combatRatioSkill == true) then
        -- Modify the skill progression by the hit chance.
        local skills = { 
            2, --tes3.skill.mediumArmor,
            3, --tes3.skill.heavyArmor,
            4, --tes3.skill.bluntWeapon,
            5, --tes3.skill.longBlade,
            6, --tes3.skill.axe,
            7, --tes3.skill.spear,
            17, --tes3.skill.unarmored,
            21, --tes3.skill.lightArmor,
            22, --tes3.skill.shortBlade,
            23, --tes3.skill.marksman,
            26, --tes3.skill.handToHand
        }
        for ix, val in ipairs(skills) do
            if (val == e.skill) then
                if (combatHitChance > 0 and e.progress > 0) then
                    e.progress = (e.progress * combatHitChance) / 100
                else
                    e.progress = 0
                end
                combatRatioSkill = false
            end
        end
    end
end

event.register(tes3.event.calcHitChance, calcHitChanceCallback)
event.register(tes3.event.detectSneak, detectSneakCallback)
event.register(tes3.event.damage, damageCallback)
event.register(tes3.event.damageHandToHand, damageHandToHandCallback)
event.register(tes3.event.exerciseSkill, exerciseSkillCallback)
mwse.log(config.Name .. ' Combat Module Initialised.')