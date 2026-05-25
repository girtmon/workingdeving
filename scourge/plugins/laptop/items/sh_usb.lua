ITEM.name = "USB Flash Drive"
ITEM.model = "models/kali/miscstuff/stalker/usb_b.mdl"
ITEM.uniqueID = "lap_usb"
ITEM.desc = "A small, one use USB device. It must be plugged into a computer."
ITEM.price = 0
ITEM.category = "Technology" -- Change this
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(51.828765869141, 43.692253112793, 31.857023239136),
	ang = Angle(25, 220, 0),
	fov = 2.2,
}
ITEM.functions.Insert = {
    onClick = function(item)
        laptop.usb = true
        laptop.usbNumber = math.random(1, table.getn(laptop.images))
    end,

	onRun = function(item)
        return true
	end,
    icon = "icon16/drive_add.png"
}
