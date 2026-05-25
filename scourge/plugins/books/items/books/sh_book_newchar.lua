ITEM.name = "[OOC] New Character Guide"
ITEM.desc = "An OOC book for new characters."
ITEM.uniqueID = "book_newchar"
ITEM.flag = "S"
ITEM.category = "Literature"
ITEM.value = 10

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

ITEM.contents = [[
<p align="center"><font color='black' size='6'>Starting Out</font></p><br/>
		
Your character is a displaced human. You remember very little about yourself- your name, your language, and maybe a few bits and pieces of your backstory. Overall, you are undergoing extreme Amnesia,
	<br/><br/>	
Your character has very little idea of how they wound up here. Last thing you did was go sleep, and you woke up here. You came with whatever was on your back at the time, though you probably don't have any personal possesions.
	<br/><br/>	
You may roleplay traits as you please. Whether you not you actually had these things before you wound up here or not is up to you- we are very free form with how traits work. Please refer to the forums to get clarifications.
	<br/><br/>	
Scourge pits you and your character into a Survival Horror scenario that holds no bars. You will brush with death often and will be put into situations that are intended to scare.
	<br/><br/>	
The server also has a large basis around mystery. The story and what is really going on is up to the player to discover, and other areas of the community (Discord, Forums) will have very little explaining the intricacies of the servers story.
	<br/><br/>	
(Please refer to the forums for special character authorizations.)
	<br/><br/>	
		
</font>
]]



ITEM.functions.Destroy = {
	name = "Destroy",
	icon = "icon16/coins.png",
	sound = "ambient/materials/cupdrop.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()

		client:notify("You have received "..item.value.." roubles.")
		char:giveMoney(item.value)
	end
}