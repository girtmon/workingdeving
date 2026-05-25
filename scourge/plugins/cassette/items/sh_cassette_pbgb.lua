--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM.name = "Paul Baribuea - Grand Ledge"
ITEM.uniqueID = "cassette_pbgb"
ITEM.price = 25
ITEM.model = "models/devcon/mrp/props/casette.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(71.303871154785, 59.847263336182, 45.463760375977),
	ang = Angle(25, 220, 0),
	fov = 4.2739087477407,
}
ITEM.flag = "V"
ITEM.category = "Music"
ITEM.noBusiness = false
ITEM.desc = "A Cassette that reads: Paul Baribuea - Grand Ledge"
ITEM.isCassette = true
ITEM.key = SCHEMA.t_cassette.Register("Example", {
		{
			name = "Last Time", --name to show up
			length = 139, --song in seconds
			url = "https://puu.sh/FxMjt/6348c8e246.mp3"
		},
		{
			name = "Better than Anything Ever",
			length = 88,
			url = "https://puu.sh/FxMmf/16c798c164.mp3"
		},
		{
			name = "Like bells",
			length = 88,
			url = "https://puu.sh/FxMns/b37e0f8bfb.mp3"
		},
		{
			name = "Things I Wish",
			length = 118,
			url = "https://puu.sh/FxMnz/95118daa56.mp3"
		},
		{
			name = "Falling in Love with your Best Friend",
			length = 175,
			url = "https://puu.sh/FxMqp/3b1550a4e4.mp3"
		},
		{
			name = "Nothing to Say",
			length = 143,
			url = "https://puu.sh/FxMs9/8984559eac.mp3"
		},
				{
			name = "Hard Work",
			length = 98,
			url = "https://puu.sh/FxMtx/50af1ed57f.mp3"
		},
				{
			name = "Ten Things",
			length = 114,
			url = "https://puu.sh/FxMu4/366332e0b8.mp3"
		},
				{
			name = "Christmas Lights",
			length = 127,
			url = "https://puu.sh/FxMuT/bfe1bb5df6.mp3"
		}
	})