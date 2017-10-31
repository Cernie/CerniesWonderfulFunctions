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

--One action to use a Mana potion based on location and item availability
function UseManaPotion()
	zone = GetRealZoneText();
	msg = nil;
	--based on battleground zone use 'Superior Mana Draught'
	if (zone == "Warsong Gulch" or zone == "Alterac Valley" or zone == "Arathi Basin") then
		if(isInBag('Superior Mana Draught') == true) then use('Superior Mana Draught'); msg = "Superior Mana Draught"; end;

	--otherwise start with 'Combat Mana Potion'
	--then 'Major Mana Potion', 'Superior Mana Potion', 'Greater Mana Potion', 'Mana Potion', 'Lesser Mana Potion'
	else
		if(isInBag('Combat Mana Potion') == true) then use('Combat Mana Potion'); msg = "Combat Mana Potion";
		elseif(isInBag('Major Mana Potion') == true) then use('Major Mana Potion'); msg = "Major Mana Potion";
		elseif(isInBag('Superior Mana Potion') == true) then use('Superior Mana Potion'); msg = "Superior Mana Potion";
		elseif(isInBag('Greater Mana Potion') == true) then use('Greater Mana Potion');  msg = "Greater Mana Potion";
		elseif(isInBag('Mana Potion') == true) then use('Mana Potion');  msg = "Mana Potion";
		elseif(isInBag('Lesser Mana Potion') == true) then use('Lesser Mana Potion');  msg = "Lesser Mana Potion";
		else msg = "Nothing"; end;
	end;
	
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--One action to use a Health potion based on location and item availability
function UseHealthPotion()
	zone = GetRealZoneText();
	msg = nil;
	--based on battleground zone use 'Surperior Healing Draught'
	if (zone == "Warsong Gulch" or zone == "Alterac Valley" or zone == "Arathi Basin") then
		if(isInBag('Superior Healing Draught') == true) then use('Superior Healing Draught'); msg = "Superior Healing Draught" end;

	--otherwise start with 'Combat Healing Potion'	
	--then 'Major Healing Potion', 'Surperior Healing Potion', 'Greater Healing Potion', 'Healing Potion', 'Lesser Healing Potion'
	else
		if(isInBag('Combat Healing Potion') == true) then use('Combat Healing Potion'); msg = "Combat Healing Potion";
		elseif(isInBag('Major Healing Potion') == true) then use('Major Healing Potion'); msg = "Major Healing Potion";
		elseif(isInBag('Superior Healing Potion') == true) then use('Superior Healing Potion'); msg = "Superior Healing Potion";
		elseif(isInBag('Greater Healing Potion') == true) then use('Greater Healing Potion'); msg = "Greater Healing Potion";
		elseif(isInBag('Healing Potion') == true) then use('Healing Potion'); msg = "Healing Potion";
		elseif(isInBag('Lesser Healing Potion') == true) then use('Lesser Healing Potion'); msg = "Lesser Healing Potion";
		else msg = "Nothing"; end;
	end;
	
	DEFAULT_CHAT_FRAME:AddMessage("BGConsumables+: "..msg.." used!");
end;

--Helper function to determine if an item is in the player's bags
function isInBag(itemName)
found = false;
for bag = 0, 4, 1
	do 
		for slot = 1, GetContainerNumSlots(bag), 1
			do local name = GetContainerItemLink(bag,slot)
			if name and string.find(name, itemName) then found = true; break; end;
		end;
	end;
return found;	
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
			buffName = split(GetPlayerBuffTexture(g(i)), "Icons\\");
			DEFAULT_CHAT_FRAME:AddMessage(""..buffName[2].."");
		i=i+1 
	end;
end;

end)