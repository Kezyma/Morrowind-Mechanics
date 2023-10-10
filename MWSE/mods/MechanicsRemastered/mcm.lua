-- Configuration
local config = require('MechanicsRemastered.config')

--- @param e modConfigReadyEventData
local function modConfigReadyCallback(e)
    -- Create and register template.
    local template = mwse.mcm.createTemplate({ name = 'Mechanics Remastered' })
    template:saveOnClose('MechanicsRemastered', config)
    template:register()

    local preferences = template:createSideBarPage({ label = 'Settings' })
    local toggles = preferences:createCategory({ label = 'Features' })

    toggles:createOnOffButton({
        label = 'Always Hit',
        description = 'Hit chance is converted into a damage multiplier. If there is a 40% chance to hit, your attacks will hit 100% of the time, but do 40% of the damage.',
        variable = mwse.mcm:createTableVariable({
            id = 'CombatEnabled',
            table = config
        })
    })

    toggles:createOnOffButton({
        label = 'Health Regeneration',
        description = 'Outside of combat, health will regenerate at the same rate as resting (0.1 x Endurance per hour).',
        variable = mwse.mcm:createTableVariable({
            id = 'HealthRegenEnabled',
            table = config
        })
    })

    toggles:createOnOffButton({
        label = 'Magicka Regeneration',
        description = 'Magicka will regenerate at the same rate as resting (0.15 x Intelligence per hour).',
        variable = mwse.mcm:createTableVariable({
            id = 'MagickaRegenEnabled',
            table = config
        })
    })

    toggles:createOnOffButton({
        label = 'Uncapped Attribute Bonuses',
        description = 'Attribute bonuses when levelling up are no longer capped after 10 skill increases and will instead stack. 15 skill increases would provide the bonus for 10 increases, plus the bonus for 5 increases. Limited to the maximum theoretical increases possible at your current level.',
        variable = mwse.mcm:createTableVariable({
            id = 'LevelupUncappedBonus',
            table = config
        })
    })

    toggles:createOnOffButton({
        label = 'Persist Skill Increases Bonuses',
        description = 'Any skill increases that did not count towards attribute bonuses for attributes that increased when levelling up will persist and be usable on the next level up.',
        variable = mwse.mcm:createTableVariable({
            id = 'LevelupPersistSkills',
            table = config
        })
    })

    toggles:createOnOffButton({
        label = 'State Based Health Increase',
        description = 'When levelling up, health will be recalculated as if the player\'s Endurance was increased by 5 for each possible level. This ignores extra possible increases due to the \'Uncapped Attribtue Bonuses\' setting.',
        variable = mwse.mcm:createTableVariable({
            id = 'HealthIncreaseEnabled',
            table = config
        })
    })
end

event.register(tes3.event.modConfigReady, modConfigReadyCallback)