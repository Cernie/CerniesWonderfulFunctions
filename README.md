# BGConsumables+
Vanilla WoW addon for PvP items.

###############################
		    BGConsumables+
        Author: Cernie
###############################


###############################
        Version History
###############################
- v1.3 Added dependency to SuperMacro. Added functions Fish, UseManaGem, and UseHealthstone. Added helper function to get an item name based on item link.
- v1.2 Added a Nom function for non-mana using classes to use. Improved health and mana potion functions to include the "Minor" versions. Fixed a bug with the health and mana potion helper function. Updated UI version so BGConsumables+ does not appear outdated.
- v1.1 Fixed an issue when attempting to use health/mana potions in BGs without Superior <type> Draught in the player's bags. Fixed an unintended addon dependency.
- v1.0 Initial release

###############################
        Installation
###############################
Unzip the BGConsumables+ folder into WoW directory Interface/Addons folder.

###############################
        Introduction
###############################
BGConsumables+ is a collection of script functions designed for easy use of PvP Battleground items such as
bandages, healing/mana potions, and food/drink. These functions are flexible in what types of items the player wishes
to use, meaning PvP'ers of all levels can take full advantage of them. Using the methods is as simple as creating
a new macro and writing a single line for /script <functionName>(<parameters>). Directions and examples are found below.

###############################
        List of Functions
###############################
- UseBGBandage(wg, ab, av, normal)
One action for using Battleground specific bandages, or use normal bandages if not in a Battleground. The parameters
are based on the item names for each battleground the player wishes to use. If the player is not in a battleground, 
the function will then use their "normal" bandage.
For example, the following command (the quotation marks are required):
/script UseBGBandage('Warsong Gulch Runecloth Bandage', 'Arathi Basin Runecloth Bandage', 'Alterac Heavy Runecloth Bandage', 'Heavy Runecloth Bandage')

- UseBGBiscuit(wg, ab, av)
One action for using Battleground specific biscuits (or food or water if the player doesn't want to use the busciuts) instead of 
regular food/water. The parameters are based on the item names for each battleground the player wishes to use.
For example, the following command (the quotation marks are required):
/script UseBGBiscuit('Warsong Gulch Enriched Ration', 'Arathi Basin Enriched Ration', 'Alterac Manna Biscuit');

- UseManaPotion()
One action to use a Mana potion based on location and item availability. This prioritizes using Battleground specific
mana potions first, then the PvP 'Combat Mana Potion' and then finally if neither are available, uses the best mana potion
the player does have in their bags. This is designed to use the PvP specific potions and save the player from using the 
most expensive potions all the time when they might want to save them for PvE raids or other times.
Order of precedence:
* Superior Mana Draught
* Combat Mana Potion
* Major Mana Potion
* Superior Mana Potion
* Greater Mana Potion
* Mana Potion
* Lesser Mana Potion
For example, the following macro command:
/script UseManaPotion()

- UseHealingPotion()
One action to use a Healing potion based on location and item availability. This prioritizes using Battleground specific
healing potions first, then the PvP 'Combat Healing Potion' and then finally if neither are available, uses the best 
healing potion the player does have in their bags. This is designed to use the PvP specific potions and save the player 
from using the most expensive potions all the time when they might want to save them for PvE raids or other times.
Order of precedence:
* Superior Healing Draught
* Combat Healing Potion
* Major Healing Potion
* Superior Healing Potion
* Greater Healing Potion
* Healing Potion
* Lesser Healing Potion
For example, the following macro command:
/script UseHealingPotion()

- UseManaGem()
Uses available Mana Gem.
For example, the following macro command:
/script UseManaGem()

- UseHealthstone()
Uses available Healthstone.
For example, the following macro command;
/script UseHealthstone()

- Nom(drinkTexture, eatTexture, water, food)
One action for drinking and eating, press twice to do both. This function works in and out of PvP Battlegrounds as it uses 
the player's normal food and drink not specific to a Battleground. It only begins drinking or eating if the player is 
currently not already drinking or eating, saving them from wasted drink and food. The drinkTexture and eatTexture parameters
are necessary in determining if the player is currently eating or drinking. These texture names can be found with a helper
function described below. The most common texture for drink is 'INV_Drink_07' while the most common texture for food is
'INV_Misc_Fork&Knife'. The water and food parameters are the names of the items the player wants to use.
For example, the following macro command:
/script Nom('INV_Drink_07', 'INV_Misc_Fork&Knife', 'Conjured Sparkling Water', 'Conjured Sweet Roll')

- NomFood(eatTexture, food)
The non-mana using class version of the above Nom function.
For example, the following macro command:
/script NomFood('INV_Misc_Fork&Knife', 'Conjured Sweet Roll')

- getBuffTextures()
Helper function for a user to determine buff texture names for use with function Nom(drinkTexture, eatTexture, water, food). 
This function returns a list of each buff texture the player currently has active. To use, eat or drink the consumable 
for the texture needed for Nom(drinkTexture, eatTexture, water, food) and run the command below.
For example:
/script getBuffTextures()

- Fish(pole)
One button to equip a fishing pole or begin fishing if a pole is equipped.
For example, the following macro command:
/script Fish("Strong Fishing Pole")
