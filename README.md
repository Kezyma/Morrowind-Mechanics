# Kezyma's Mechanics Remastered
This is an MWSE plugin for Morrowind that aims to provide modernised versions of vanilla mechanics in Morrowind. The goal is to make it easier for new players to get into Morrowind while also preserving the original mechanics and balance.

The plugin is fully modular and each feature can be toggled off through the Mod Configuration Menu.

REQUIRES: The latest build of [MWSE](https://github.com/MWSE/MWSE/releases)

## Combat Features
The combat features of this mod are designed to recreate common features in modern games that newer players may find offputting while maintaining the original mathematics Morrowind used in each case.

### Always Hit
This setting converts the hit chance of weapons into a damage modifier. As long as the hit chance of an attack is >0, the attack will hit. However, the damage of the attack is proportional to the original hit chance.
e.g. An attack with a 40% chance of hitting will hit 100% of the time, but deal 40% of the damage.

### Health Regeneration
This setting enables passive health regeneration. Outside of combat, health will regenerate at the same rate as when resting (10% of Endurance per hour).

### Magicka Regeneration
This setting enables passive magicka regeneration. Magicka will regenerate at the same rate as when resting (15% of Intelligence per hour).

## Leveling Features
The leveling features of this mod are designed to eliminate any need to min-max or optimise attribute increases when leveling up. With these settings, no bonuses are ever lost or missed out on, while also keeping within the limits of optimal leveling in the base game. 

### Uncapped Attribute Bonuses.
This setting allows attribute bonuses while leveling up to stack.
e.g. If you have leveled up 15 skills for an attribute, you will get the bonus for 10 skill increases as normal, as well as the bonus for 5 skill increases.
This is capped to the maximum theoretical skill increases for your current level (+5 at level 2, +10 at level 3, +15 at level 4, etc) to prevent overleveling attributes beyond the base game limits.

### Persist Skill Increase Bonuses
This setting persists skill increases towards attribute bonuses across levels.
e.g. If you have 10 skill increases in Strength skills, but you did not pick Strength as an attribute to increase that level, those 10 skill increases will count towards the bonus next level. If instead, you have 15 skill increases for Strength, but only got a +5 bonus, the remaining 5 skill increases that did not count towards that bonus will be carried over to the next level.

### State-Based Health Increase
This setting enables a retroactive health calculation that assumes you chose the maximum possible Endurance bonus on each level up. 
