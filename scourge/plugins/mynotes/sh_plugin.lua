local PLUGIN = PLUGIN

PLUGIN.name = "My Notes"
PLUGIN.author = "Blt950"
PLUGIN.desc = "Adds the /mynotes command so people can save stuff they self want to remember."

if (SERVER) then
	netstream.Hook("EditNotes", function(client, data)
		if (client.editNotesAuthorised == data[1] and type(data[2]) == "string") then
			data[1]:getChar():setData("notesdata", string.sub(data[2], 0, 500))

			client.editNotesAuthorised = nil
		end
	end)
else
	netstream.Hook("EditNotes", function(data)
		if (IsValid(data[1])) then
			print("Opening shit")
			if (nut.gui.notesPanel and nut.gui.notesPanel:IsValid()) then
				nut.gui.notesPanel:Close()
				nut.gui.notesPanel:Remove()
			end

			nut.gui.notesPanel = vgui.Create("nsNotes")
			nut.gui.notesPanel:Populate(data[1], data[2] or "")
			nut.gui.notesPanel:MakePopup()

			gui.EnableScreenClicker(true)
		end
	end)
end

nut.command.add("mynotes", {
	onRun = function(client, arguments)
		netstream.Start(client, "EditNotes", {client, client:getChar():getData("notesdata")} )
		client.editNotesAuthorised = client
	end
})