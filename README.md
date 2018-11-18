[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=3LLQHP7FGQJWL&currency_code=USD)

# CerniesWonderfulFunctions

Author: Cernie


Installation:


Unzip the CerniesWonderfulFunctions folder into WoW directory Interface/Addons folder. Remove the -master from the folder name.


###############################
        Introduction
###############################


CerniesWonderfulFunctions is a collection of script functions for Vanila World of Warcraft designed for easy use of PvP Battleground items such as bandages, healing/mana potions, and food/drink. In addition, common useful macro functions are available as well. 
These functions are flexible in what types of items the player wishes to use, meaning players of all levels can take full advantage of them. Using the methods is as simple as creating a new macro and writing a single line for /script <functionName>(<parameters>). Directions and examples are found below.

###############################
        List of Functions
###############################
- UseBGBandage(wg, ab, av, normal)
One action for using Battleground specific bandages, or use normal bandages if not in a Battleground. The parameters
are based on the item names for each battleground the player wishes to use. If the player is not in a battleground, 
the function will then use their "normal" bandage.
For example, the following command (the quotation marks are required):

<code>/script UseBGBandage('Warsong Gulch Runecloth Bandage', 'Arathi Basin Runecloth Bandage', 'Alterac Heavy Runecloth Bandage', 'Heavy Runecloth Bandage')</code>

- UseBGBiscuit(wg, ab, av)
One action for using Battleground specific biscuits (or food or water if the player doesn't want to use the busciuts) instead of 
regular food/water. The parameters are based on the item names for each battleground the player wishes to use.
For example, the following command (the quotation marks are required):

<code>/script UseBGBiscuit('Warsong Gulch Enriched Ration', 'Arathi Basin Enriched Ration', 'Alterac Manna Biscuit');</code>

- UseManaPotion()
One action to use a Mana potion based on location and item availability. This prioritizes using Battleground specific
mana potions first, then the PvP 'Combat Mana Potion' and then finally if neither are available, uses the best mana potion
the player does have in their bags. This is designed to use the PvP specific potions and save the player from using the 
most expensive potions all the time when they might want to save them for PvE raids or other times.
Order of precedence:
* Major Mana Draught
* Major Mana Potion
* Combat Mana Potion
* Superior Mana Potion
* Greater Mana Potion
* Mana Potion
* Lesser Mana Potion
For example, the following macro command:

<code>/script UseManaPotion()</code>

- UseHealingPotion()
One action to use a Healing potion based on location and item availability. This prioritizes using Battleground specific
healing potions first, then the PvP 'Combat Healing Potion' and then finally if neither are available, uses the best 
healing potion the player does have in their bags. This is designed to use the PvP specific potions and save the player 
from using the most expensive potions all the time when they might want to save them for PvE raids or other times.
Order of precedence:
* Major Healing Draught
* Major Healing Potion
* Combat Healing Potion
* Superior Healing Potion
* Greater Healing Potion
* Healing Potion
* Lesser Healing Potion
For example, the following macro command:

<code>/script UseHealingPotion()</code>

- UseManaGem()
Uses available Mana Gem.
For example, the following macro command:

<code>/script UseManaGem()</code>

- UseHealthstone()
Uses available Healthstone.
For example, the following macro command;

<code>/script UseHealthstone()</code>

- Nom(water, food)
One action for drinking and eating, press twice to do both. This function works in and out of PvP Battlegrounds as it uses 
the player's normal food and drink not specific to a Battleground. It only begins drinking or eating if the player is 
currently not already drinking or eating and not already at full health or mana, saving them from wasted drink and food. 
The water and food parameters are the names of the items the player wants to use.
For example, the following macro command:

<code>/script Nom('Conjured Sparkling Water', 'Conjured Sweet Roll')</code>

- NomFood(food)
The non-mana using class version of the above Nom function.
For example, the following macro command:

<code>/script NomFood('Conjured Sweet Roll')</code>

- NomWater(water)
The water only version of the above Nom function.
For example, the following macro command:

<code>/script NomFood('Conjured Sparkling Water')</code>

- MageDPM(spell1, spell2)
Useful for Mage, Shaman or Druid with a clearcasting talent. Casts spell2 until a clearcast proc occurs then stops casting and
casts spell1. A mage for instance, could switch between rank 1 and max rank Arcane Missiles for getting the most damage once OOM.
For example, the following macro command:

<code>/script MageDPM("Arcane Missiles", "Arcane Missiles(Rank 1)");</code>

- ToggleEquipItemSlot(slot, item1, item2)
Switches between two pieces of gear for a specified item slot. The slot parameter requires the name of the Inventory slot constant.
For example, the following macro command:

<code>/script ToggleEquipItemSlot("SECONDARYHANDSLOT", "Talon of Furious Concentration", "Skull of Impending Doom");</code>

- Shapeshift(form, isPowerShift, isGCD)
Druid function to use a specific shapeshift based on the name (ie "Cat Form"). Set isPowerShift to true if you want to shift out and back in, or
false if you do not. Set isGCD to true if you want to wait to shift until you are off the global cooldown, or false if you do not.
For example, the following macro command:

<code>/script Shapeshift("Travel Form", true, true);</code>

- CancelShapeshift()
Druid function to shift the player out of form into humanoid form. Useful in macros for when the player wants to cast a spell. Requires two 
button presses when used in this manner.
For example, the following macro command:

<code>/script CancelShapeshift();
        
/script CastSpellByName("Regrowth");</code>

- FeralCharge()
Druid function to shift the player into Bear Form and cast Feral Charge. Multiple button presses are required as the function will also shift the 
player out of other forms and then into Bear Form.
For example, the following macro command:

<code>/script FeralCharge();</code>

- getShapeshiftForm()
Druid function that returns the index of the current form the player is in. Returns 0 if the player is in humanoid form. Useful helper function for 
custom macros.
For example, the following macro command:

<code>/script if(getShapeshiftForm() == 1) then DEFAULT_CHAT_FRAME:AddMessage("I am in Bear Form"); end;</code>

- isBuffNameActive(buff, unit)
Function to query a buff name on the specified unit. Returns true/false based on if buff name is found, the index of the buff found, and the total 
number of buffs the unit has. Unit parameter is based on API unit (ie "player" or "target"). Useful in saving space in custom macros for 
decision based logic. Note this does not work with enemy targets.
For example, the following macro command:

<code>/script local isActive, index, numBuffs = isBuffNameActive("Arcane Intellect", "player") if(isActive == false) then CastSpellByName("Arcane Intellect"); end;</code>

- isDebuffNameActive(debuff, unit)
Function similar to isBuffNameActive(buff, unit) but for debuffs. However, this DOES apply to enemy targets.
For example, the following macro command:

<code>/script local isDebuff, index, numDebuffs = isDebuffNameActive("Corruption", "target") if(isDebuff == false) then CastSpellByName("Corruption"); end;</code>

- findAttackActionSlot()
Function to find an Attack Action on the players action bars. Returns the index of the action bar slot if the action is an attack action and if it 
is currently being used (blinking), otherwise returns 0 if no action is found. Useful in custom macros for determining if the player is currently 
auto attacking.
For example, the following macro command:

<code>/script if(findAttackActionSlot() == 0) then AttackTarget(); end;</code>

- findAutoRangedActionSlot()
Function similar to findAttackActionSlot() but for ranged or wand auto attacks.
For example, the following macro command:

<code>/script if(findAutoRangedActionSlot() == 0) then CastSpellByName("Shoot"); end;</code>

- isTargetDebuff(target, debuff)
Function to determine if a debuff texture name is active on the target (ie "player" or "target"). Returns boolean (true or false) if found. Useful to 
check a texture name if the debuff name is unknown, otherwise refer to isDebuffNameActive(debuff, unit).
For example, the following macro command:

<code>/script if(isTargetDebuff("target", "Ability_GhoulFrenzy")) then CastSpellByName("Ferocious Bite") else CastSpellByName("Rip") end;</code>

- ModifySpellAction(options)
This function achieves something similar as patch 2.0 (and beyond) [mod: <modifier>] syntax in macros. I have two versions, one more advanced than the other. 
The usual rules apply, so if you add this macro to your 1 button but have shift + 1 bound to another button, holding shift + 1 will use that action rather than 
the one in this macro. Clicking does bypass this for ctrl and alt modifiers, however.
For example, the following macro command:

<code>/script ModifySpellAction{unmod="Conjure Water(Rank 7)", shift="Conjure Food(Rank 6)", ctrl="Conjure Mana Ruby", alt="Conjure Mana Citrine"};</code>

- ModifyKeyAction(options)
Function similar to ModifySpellAction(options), but can do more than just cast spells or use abilities.
For example, the following macro command (requires SuperMacro addon):

<code>/script ModifyKeyAction{unmod = 'CastSpellByName("Fire Blast")', shift = 'CastSpellByName("Fire Blast(Rank 1)")', alt = 'use("Iron Grenade")', ctrl = 'Macro("MountBoots")'};</code>

- MountAQ(normal, aq)
Function to use a mount based on location. If the player is in AQ40 the function will use the specified AQ40 mount, otherwise the function will use the 
player's normal mount.
For example, the following macro command:

<code>/script MountAQ("Swift White Ram", "Green Qiraji Resonating Crystal");</code>

- UseItemInBag(itemName, self)
Function to use an item in the player's container bags based on the name of the item. The parameter "self" is optional, pass 1 to use the item on yourself.
For example, the following macro command:

<code>/script UseItemInBag("Iron Grenade");</code>

- getSpellId(spell)
Function to find the spell id given a spell name, returns the spell id necessary for other API calls. Useful to reduce macro length when getting information
about a spell from the player's spell book.
For example, the following macro command:

<code>/script local _, duration, _ = GetSpellCooldown(getSpellId("Swiftmend"), BOOKTYPE_SPELL) if(duration == 0) then CastSpellByName("Swiftmend") else DEFAULT_CHAT_FRAME:AddMessage("Swiftmend on cooldown.") end;</code>

- isSpellOnCd(spell)
Function to find out if a spell is on Cooldown based on the spell name. Returns true or false.
For example, the following macro command:

<code>/script local cd = isSpellOnCd("Swiftmend") if(not cd) then CastSpellByName("Swiftmend") else DEFAULT_CHAT_FRAME:AddMessage("Swiftmend on cooldown!") end;</code>

- isContainerItemOnCd(itemName)
Function to find out if a container item is on Cooldown based on the item name. Returns true or false.
For example, the following macro command:

<code>/script local cd = isContainerItemOnCd("Major Healing Potion") if(not cd) then UseContainerItem("Major Healing Potion") end;</code>

- findActionSlot(spellTexture)
Function to find an action slot id based on the texture of the button. Returns the id of the action slot or 0 if not found.
Useful in cases where getSpellId(spell) is not available.
For example, the following macro command:

<code>/script if(IsUsableAction(findActionSlot("Ability_Warrior_Revenge")) == 1) then CastSpellByName("Revenge") else CastSpellByName("Heroic Strike") end</code>

- ToggleAutoAttack(switch)
Function to turn auto attack on or off based on what is passed to switch. Switch can be either "on" or "off".
For example, the following macro command:

<code>/script ToggleAutoAttack("on")</code>

- isInBag(itemName)
Function to find a container item based on the item name. Returns boolean (true/false) based on if the item is found, the item's bag id, and the item's slot id.
Useful in greatly reducing macro length and helps in logic to determine if an item gets used or equipped.
For example, the following macro command:

<code>/script local found, bag, slot = isInBag("Major Healing Potion") if(found) then UseContainerItem(bag, slot, 1) else DEFAULT_CHAT_FRAME:AddMessage("Major Healing Potion not found!") end;</code>

- getItemName(itemLink)
Function to take an item link and extract the item name. Helper to isInBag(itemName) for comparing names of container items.

- isBuffTextureActive(texture)
Function similar to isBuffNameActive(buff) but for texture names but more limited in that it only returns true/false based on if the texture name is active on the player.

- getBuffTextures()
Helper function for a user to determine buff texture names for use with function Nom(drinkTexture, eatTexture, water, food). 
This function returns a list of each buff texture the player currently has active. To use, eat or drink the consumable 
for the texture needed for Nom(drinkTexture, eatTexture, water, food) and run the command below.
For example:

<code>/script getBuffTextures()</code>

- Fish(pole)
One button to equip a fishing pole or begin fishing if a pole is equipped. Hold a modifier key (ctrl, alt, shift) + button to attach the best available lure in inventory.
For example, the following macro command:

<code>/script Fish("Strong Fishing Pole")</code>

