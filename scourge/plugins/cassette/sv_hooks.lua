local PLUGIN = PLUGIN

-- Called when plugins are initialized.
PLUGIN:LoadCassettes()

-- Called when data should be saved.
function PLUGIN:SaveData()
	self:SaveCassettes()
end