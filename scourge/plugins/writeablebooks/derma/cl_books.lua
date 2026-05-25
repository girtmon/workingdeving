--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PANEL = {}

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetBackgroundBlur(true)
	self:SetDeleteOnClose(false)
	
	-- Called when the button is clicked.
	function self.btnClose.DoClick(button)
		self:Close() self:Remove()
		
		gui.EnableScreenClicker(false)
	end
	
	self.panelList = vgui.Create("DPanelList", self)
 	self.panelList:SetPadding(2)
 	self.panelList:SetSpacing(3)
 	self.panelList:SizeToContents()
	self.panelList:EnableVerticalScrollbar()
end

-- Called each frame.
function PANEL:Think()
	local scrW = ScrW()
	local scrH = ScrH()
	
	if self.item then
		self:SetSize(1000, (self.item:getData("booktitle") == nil and 800 or 772))
	else
		self:SetSize(1000, 800)
	end
	self:SetPos( (scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) )
end

-- A function to populate the panel.
function PANEL:Populate()
	self:SetTitle( self.item:getData("booktitle","Unnamed Book") )
	
	self.panelList:Clear()
	
	local textEntry = vgui.Create("DTextEntry")
	local button = vgui.Create("DButton")
	
	textEntry:SetMultiline(true)
	textEntry:SetHeight(710)
	textEntry:SetText(self.item:getData("bookdata",""))
	textEntry:SetEnabled(self.item:getData("booktitle") == nil)
	
	button:SetText("Okay")
	
	-- A function to set the text entry's real value.
	function textEntry:SetRealValue(text)
		self:SetValue(text)
		self:SetCaretPos( string.len(text) )
	end
	
	-- Called each frame.
	function textEntry:Think()
		local text = self:GetValue()
		
		if (string.len(text) > 5000) then
			self:SetRealValue( string.sub(text, 0, 5000) )
			
			surface.PlaySound("common/talk.wav")
		end
	end
	
	-- Called when the button is clicked.
	function button.DoClick(button)
		self:Close() self:Remove()
		
		netstream.Start( "EditBook", {textEntry:GetValue(), false, self.item:getID()} )
		
		gui.EnableScreenClicker(false)
	end

	self.panelList:AddItem(textEntry)
	self.panelList:AddItem(button)
	
	if self.item:getData("booktitle") == nil then
		local button2 = vgui.Create("DButton")
		
		button2:SetText("Sign")
		
		function button2.DoClick(button)
			self:Close() self:Remove()
			
			netstream.Start( "EditBook", {textEntry:GetValue(), true, self.item:getID()} )
			
			gui.EnableScreenClicker(false)
		end
		
		self.panelList:AddItem(button2)
	end
end

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.panelList:StretchToParent(4, 28, 4, 4)
	
	DFrame.PerformLayout(self)
end

vgui.Register("nsBooks", PANEL, "DFrame")