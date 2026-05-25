local PANEL = {}
	function PANEL:Init()

        self.button = self:Add("DButton")
        self.button:Dock(FILL)

		self.button:SetFont("cpFont")
		self.button:SetExpensiveShadow(2, Color(0, 0, 0, 200))
		self.button:SetTextColor(color_white)
		self.button:SetDrawBackground(false)
		self.button.OldSetTextColor = self.button.SetTextColor
		self.button.SetTextColor = function(this, color)
			this:OldSetTextColor(color)
			this:SetFGColor(color)
		end

	end

vgui.Register("nutMenuImgButton", PANEL, "DHTML")