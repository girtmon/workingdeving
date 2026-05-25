ITEM.name = "Laptop"
ITEM.model = "models/illusion/eftcontainers/laptop.mdl"
ITEM.desc = "A white Megasonic Touchbook™ with black edges. It is reinforced with steel for drop protection."
ITEM.uniqueID = "lap_laptop"
ITEM.price = 0
ITEM.category = "Technology" -- Change this
ITEM.flag = "v"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 6.4705882352941,
	outline = true,
	outlineColor = Color(255, 255, 255)
}
laptop = {}
laptop.usb = false 
laptop.usbNumber = 0

local systemName = "SYSTEM" .. math.random(100, 9999)

ITEM.functions.Start = {
	onClick = function(item)
		local name = item.player:getChar().vars.name
		local message = ""

		local frame = vgui.Create("DFrame")
		frame:SetSize(ScrW() * 0.9, ScrH() * 0.9 )
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()
		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)

		if laptop.usb then
			message = '[[<a style="color: white; float:left;">bash: /mnt/e/autorun.sh: Mounted successfully</a><br><img src="' .. laptop.images[laptop.usbNumber] .. '"style="position: absolute; top: 50%; left: 50%; width:' .. ScrW() * 0.7  ..'; height:' .. ScrH() * 0.7  ..'; margin-top:' .. -ScrH() * 0.7 / 2  ..'; margin-left:' .. -ScrW() * 0.7 / 2  ..';"]]'
		else
			message = '[[<a style="color: white; float:left;">bash: /mnt/e/autorun.sh: No such file or directory</a>]]'
		end 

		frame.html:SetHTML(
			[[<html>
				<body style="background-color: black; font-family: 'ubuntu'; font-size 16px; text-align: justify;">
					<a style="color:rgb(0, 255, 0);">]] .. string.gsub(name," ", "_") .. "@" .. systemName ..[[</a> <a style="color: white;">:<a> <a style="color: lightblue;">~<a> <a style="color: white;">$ sudo bash /mnt/e/autorun.sh</a><br>
				]] ..
				message
				..[[
					<br><a style="color:rgb(0, 255, 0);">]] .. string.gsub(name," ", "_") .. "@" .. systemName ..[[</a> <a style="color: white;">:<a> <a style="color: lightblue;">~<a> <a style="color: white;">$</a><br>
				</body>
			</html>]]
		)
		laptop.usb = false
		laptop.usbNumber = 0
	end,
	onRun = function(item)
		return false
	end,
	icon = "icon16/application_xp_terminal.png"
}
