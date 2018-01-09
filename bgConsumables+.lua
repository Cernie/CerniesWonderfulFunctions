local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_LOGIN")

Frame:SetScript("OnEvent", function(...)

--One action for using Battleground specific bandages, or use normal bandages if not in a Battleground
function UseBGBandage(wg, ab, av, normal)
--'Warsong Gulch Runecloth Bandage''Alterac Heavy Runecloth Bandage''Arathi Basin Runecloth Bandage''Heavy Runecloth Bandage'
	zone = GetRealZoneText();
	msg = nil;
	
	if(zone == "Warsong Gulch" and isInBag(wg) == true) then use(wg); msg = wg;
	elseif(zone == "Alterac Valley" and isInBag(av) == true) then use(av); msg = av;
	elseif(zone == "Arathi Basin" and isInBag(ab) == true) then use(ab); msg = ab;
	elseif(isInBag(normal)) then use(normal); msg = normal;
	else msg = "Nothing"; end;
	
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--One action for using Battleground specific biscuits instead of regular food/water
function UseBGBiscuit(wg, ab, av)
--'Warsong Gulch Enriched Ration''Alterac Manna Biscuit''Arathi Basin Enriched Ration'
	zone = GetRealZoneText();
	msg = nil;
	
	if(zone == "Warsong Gulch" and isInBag(wg) == true) then use(wg); msg = wg;
	elseif(zone == "Alterac Valley" and isInBag(av) == true) then use(av); msg = av;
	elseif(zone == "Arathi Basin" and isInBag(ab) == true) then use(ab); msg = ab;
	else msg = "Nothing"; end;
	
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--One action for drinking and eating, press twice to do both
function Nom(drinkTexture, eatTexture, water, food)

	if(isBuffTextureActive(drinkTexture) == false and isInBag(water) == true) then use(water);
	elseif(isBuffTextureActive(eatTexture) == false and isInBag(food) == true) then use(food); end;
	
end;

--One action for eating for non mana using classes
function NomFood(eatTexture, food)
	if (isBuffTextureActive(eatTexture) == false and isInBag(food) == true) then use(food); end;
end;

--One action to use a Mana potion based on location and item availability
function UseManaPotion()
	zone = GetRealZoneText();
	msg = nil;
	--based on battleground zone use 'Superior Mana Draught'
	if (isInBag('Superior Mana Draught') == true and (zone == "Warsong Gulch" or zone == "Alterac Valley" or zone == "Arathi Basin")) then
		use('Superior Mana Draught'); msg = "Superior Mana Draught";

	--otherwise start with 'Combat Mana Potion'
	--then 'Major Mana Potion', 'Superior Mana Potion', 'Greater Mana Potion', 'Mana Potion', 'Lesser Mana Potion'
	else
		if(isInBag('Combat Mana Potion') == true) then use('Combat Mana Potion'); msg = "Combat Mana Potion";
		elseif(isInBag('Major Mana Potion') == true) then use('Major Mana Potion'); msg = "Major Mana Potion";
		elseif(isInBag('Superior Mana Potion') == true) then use('Superior Mana Potion'); msg = "Superior Mana Potion";
		elseif(isInBag('Greater Mana Potion') == true) then use('Greater Mana Potion');  msg = "Greater Mana Potion";
		elseif(isInBag('Mana Potion') == true) then use('Mana Potion');  msg = "Mana Potion";
		elseif(isInBag('Lesser Mana Potion') == true) then use('Lesser Mana Potion');  msg = "Lesser Mana Potion";
		elseif(isInBag('Minor Mana Potion') == true) then use('Minor Mana Potion');  msg = "Minor Mana Potion";
		else msg = "Nothing"; end;
	end;
	
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--One action to use a Health potion based on location and item availability
function UseHealthPotion()
	zone = GetRealZoneText();
	msg = nil;
	--based on battleground zone use 'Surperior Healing Draught'
	if (isInBag('Superior Healing Draught') == true and (zone == "Warsong Gulch" or zone == "Alterac Valley" or zone == "Arathi Basin")) then
		use('Superior Healing Draught'); msg = "Superior Healing Draught";

	--otherwise start with 'Combat Healing Potion'	
	--then 'Major Healing Potion', 'Surperior Healing Potion', 'Greater Healing Potion', 'Healing Potion', 'Lesser Healing Potion'
	else
		if(isInBag('Combat Healing Potion') == true) then use('Combat Healing Potion'); msg = "Combat Healing Potion";
		elseif(isInBag('Major Healing Potion') == true) then use('Major Healing Potion'); msg = "Major Healing Potion";
		elseif(isInBag('Superior Healing Potion') == true) then use('Superior Healing Potion'); msg = "Superior Healing Potion";
		elseif(isInBag('Greater Healing Potion') == true) then use('Greater Healing Potion'); msg = "Greater Healing Potion";
		elseif(isInBag('Healing Potion') == true) then use('Healing Potion'); msg = "Healing Potion";
		elseif(isInBag('Lesser Healing Potion') == true) then use('Lesser Healing Potion'); msg = "Lesser Healing Potion";
		elseif(isInBag('Minor Healing Potion') == true) then use('Minor Healing Potion'); msg = "Minor Healing Potion";
		else msg = "Nothing"; end;
	end;
	
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--Uses available Mana Gem
function UseManaGem()
	msg = "Nothing";
	gem = {"Mana Ruby", "Mana Citrine", "Mana Jade", "Mana Agate"};
	for i=1, 4 do
		if(isInBag(gem[i]) == true) then use(gem[i]); msg = gem[i]; break; end;
	end;
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--Uses available Healthstone
function UseHealthstone()
	msg = "Nothing";
	healthstone = {"Major Healthstone", "Greater Healthstone", "Healthstone", "Lesser Healthstone", "Minor Healthstone"};
	for i=1, 5 do
		if(isInBag(healthstone[i]) == true) then use(healthstone[i]); msg = healthstone[i]; break; end;
	end;
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--Decide which spell to cast based on Clearcast proc
function MageDPM(spell1, spell2)
   texture = "Spell_Shadow_ManaBurn";

   if(isBuffTextureActive(texture)) then SpellStopCasting(); CastSpellByName(spell1);

   else  CastSpellByName(spell2); end;

end;

--Equip Fishing pole or begin fishing if a pole is equipped
function Fish(pole)
	mainHandLink = GetInventoryItemLink("player", GetInventorySlotInfo("MainHandSlot"));
	mainHandName = getItemName(mainHandLink);
	
	if (mainHandName ~= pole and isInBag(pole) == true) then use(pole);
	else CastSpellByName("Fishing");
	end;
end;

--Helper function to determine if an item is in the player's bags
function isInBag(itemName)
	found = false;
	name2 = nil;
	index1 = nil;
	index2 = nil;
	bracketStart = "|h";
	bracketEnd = "]";
	for bag = 0, 4, 1
		do 
			for slot = 1, GetContainerNumSlots(bag), 1
				do local name = GetContainerItemLink(bag,slot)
				if name and string.find(name, itemName) then
					index1 = string.find(name, bracketStart);
					index2 = string.find(name, bracketEnd);
					name2 = string.sub(name, index1 + 3, index2 - 1);
					if string.find(name2, itemName) == 1 then found = true; break; end;
				end;
			end;
		end;
	return found;	
end;

--Helper function to get an item name given an item link
function getItemName(itemLink)
	name = nil;
	index1 = nil;
	index2 = nil;
	bracketStart = "|h";
	bracketEnd = "]";
	
	index1 = string.find(itemLink, bracketStart);
	index2 = string.find(itemLink, bracketEnd);
	name = string.sub(itemLink, index1 + 3, index2 - 1);
	return name;
end;

--Helper function to determine if a specific buff texture is active
function isBuffTextureActive(texture)
	i=0;
	g=GetPlayerBuff;
	isBuffActive = false;

	while not(g(i) == -1)
	do
		if(strfind(GetPlayerBuffTexture(g(i)), texture)) then isBuffActive = true; end;
		i=i+1
	end;	
	return isBuffActive;
end;

--Helper function for a user to determine buff texture names for use with function Nom
function getBuffTextures()
	i = 0; 
	g = GetPlayerBuff;
	while not(g(i) == -1)
		do
			buffName = string.split(GetPlayerBuffTexture(g(i)), "Icons\\");
			DEFAULT_CHAT_FRAME:AddMessage(""..buffName[2].."");
		i=i+1 
	end;
end;

--Function to split a string
function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

end)