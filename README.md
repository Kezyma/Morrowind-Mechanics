# Kezyma's Mechanics Remastered
This is an MWSE plugin for Morrowind that aims to provide modernised versions of vanilla mechanics in Morrowind. The goal is to make it easier for new players to get into Morrowind while also preserving the original mechanics and balance.

The plugin is fully modular and each feature can be toggled off through the Mod Configuration Menu.

REQUIRES: The latest build of [MWSE](https://github.com/MWSE/MWSE/releases)


## Combat Features
The combat features of this mod are designed to recreate common features in modern games that newer players may find offputting while maintaining the original mathematics Morrowind used in each case.

### Always Hit
This setting converts the hit chance of weapons into a damage modifier. As long as the hit chance of an attack is >0, the attack will hit. However, the damage of the attack is proportional to the original hit chance.
e.g. An attack with a 40% chance of hitting will hit 100% of the time, but deal 40% of the damage.

To mitigate the advantage this gives to on-strike enchants, the charge cost of on-strike enchanted weapons is proportional to the original hit chance.
e.g. An on-strike enchant with a 50% hit chance will cost 2x the default amount of charge.

To mitigate the increased effect of staggering when every attack hits, the original hit chance roll is used to determine whether an attack staggers or not.
e.g. An attack that originally had a 50% hit chance will have a 50% chance of causing a stagger.

### Always Cast
This setting converts the cast chance of a spell into a magicka cost modifier. As long as the cast chance is >0, the spell will be casted successfully. However, the magicka cost of the spell is proportional to the original cast chance.
e.g. A spell with a 50% cast chance at a cost of 10 magicka will cost 20 magicka to cast.

The magic menu has been updated to show the current cost of casting each spell as well as the minimum cost of casting the spell.

### Health Regeneration
This setting enables passive health regeneration. Outside of combat, health will regenerate at the same rate as when resting (10% of Endurance per hour).

### Magicka Regeneration
This setting enables passive magicka regeneration. Magicka will regenerate at the same rate as when resting (15% of Intelligence per hour).

## Leveling Features
The leveling features of this mod are designed to eliminate any need to min-max or optimise attribute increases when leveling up. With these settings, no bonuses are ever lost or missed out on, while also keeping within the limits of optimal leveling in the base game. 

### Uncapped Attribute Bonuses.
This setting allows attribute bonuses while leveling up to stack.
e.g. If you have leveled up 15 skills for an attribute, you will get the bonus for 10 skill increases as normal, as well as the bonus for 5 skill increases.

This is capped to the maximum theoretical skill increases for your current level to prevent over-leveling attributes beyond the base game limits.
e.g. If you took a +5 bonus to Strength on reaching level 2, the highest bonus you could receive at level 3 is also +5. If you did not take a +5 bonus to Strength at level 2, the highest bonus you could receive at level 3 is +10.

### Persist Skill Increase Bonuses
This setting persists skill increases towards attribute bonuses across levels.
e.g. If you have 10 skill increases in Strength skills, but you did not pick Strength as an attribute to increase that level, those 10 skill increases will count towards the bonus next level. If instead, you have 15 skill increases for Strength, but only got a +5 bonus, the remaining 5 skill increases that did not count towards that bonus will be carried over to the next level.

### State-Based Health Increase
This setting enables a retroactive health calculation that assumes you chose the maximum possible Endurance bonus on each level up. 

## Other Features
Further features that may help a new player navigating the game.

### Fast Travel
This setting enables modern fast travel using the world map. 
As long as the player isn't in combat, isn't over-encumbered, isn't indoors and has visited a location before, it is possible to fast travel by clicking any of the world map markers.
During travel, time will pass equivalent of the player travelling from their current position to the destination at their walking speed.

Players will be spawned at the first available point in the following list;
- Silt Strider, Gondolier or Boat port.
- Divine Intervention location.
- Almsivi Intervention location.
- Door above water level.
- Center of the location on the map.