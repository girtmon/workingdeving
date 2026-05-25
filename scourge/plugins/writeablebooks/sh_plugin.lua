local PLUGIN = PLUGIN

PLUGIN.name = "Book Writing"
PLUGIN.author = "Blt950 + Seamus"
PLUGIN.desc = "Slightly modifies /mynotes to allow for writing books."

if (SERVER) then
	netstream.Hook("EditBook", function(client, data)
		print("Residency: "..tostring(data[1]))
		local item = nut.item.instances[data[3]]
	
		if (type(data[1]) == "string") then
			item:setData("bookdata", string.sub(data[1], 0, 2000))
		end
		
		print("Set item text to: "..data[1])
		
		if data[2] then
			client:requestString("Book Title", "Finalize the book title...", function(text)
				item:setData("booktitle",text)
			end, "Unnamed Book" )
		end
	end)
else
	netstream.Hook("EditBook", function(data)
		if (nut.gui.bookPanel and nut.gui.bookPanel:IsValid()) then
			nut.gui.bookPanel:Close()
			nut.gui.bookPanel:Remove()
		end

		nut.gui.bookPanel = vgui.Create("nsBooks")
		nut.gui.bookPanel.item = nut.item.instances[data]
		timer.Simple(0,function()
			nut.gui.bookPanel:Populate()
		end)
		nut.gui.bookPanel:MakePopup()

		gui.EnableScreenClicker(true)
	end)
end