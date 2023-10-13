-- Configuration
local config = require('MechanicsRemastered.config')
local mcm = require('MechanicsRemastered.mcm')
local version = '0.0.6'
-- Initialisation
--- @param e initializedEventData
local function initializedCallback(e)
    -- Combat Overhaul
    dofile("MechanicsRemastered.mechanics.combat")
    -- Magicka Regen Overhaul
    dofile("MechanicsRemastered.mechanics.magickaregen")
    -- Health Regen Overhaul
    dofile("MechanicsRemastered.mechanics.healthregen")
    -- Health Increase Overhaul
    dofile("MechanicsRemastered.mechanics.healthincrease")
    -- Leveling Overhaul
    dofile("MechanicsRemastered.mechanics.levelup")
    -- Spellcasting Overhaul
    dofile("MechanicsRemastered.mechanics.spellcast")

    mwse.log(config.Name .. ' v' .. version .. ' Fully Initialised.')
end
event.register(tes3.event.initialized, initializedCallback)