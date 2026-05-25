local PANEL = {}
	local gradient = nut.util.getMaterial("vgui/gradient-u")
	local gradient2 = nut.util.getMaterial("vgui/gradient-d")

	function PANEL:Init()
		self:SetMouseInputEnabled(true)
        

		self.value = 0
		self.deltaValue = self.value
		self.max = 10

        
		self.Paint = function(this, w, h)

			local value = self.deltaValue / self.max

            
            

			if (value > 0) then
				local color = nut.config.get("color")
				local boostedValue = self.boostValue or 0
				local add = 0

				if (self.deltaValue != self.value) then
					add = 35
				end

				-- your stat
				do
					if !(boostedValue < 0 and math.abs(boostedValue) > self.value) then
						surface.SetDrawColor(7, 213, 116, 230)
						surface.DrawRect(2, 2, w * value, h)
					end
				end

				-- boosted stat
				do
				if (boostedValue != 0) then

					if (boostedValue < 0) then
						local please = math.min(self.value, math.abs(boostedValue))
						boostValue = ((please or 0) / self.max) * (self.deltaValue / self.value)
					else
						boostValue = ((boostedValue or 0) / self.max) * (self.deltaValue / self.value)
					end

					if (boostedValue < 0) then
						surface.SetDrawColor(200, 40, 40, 230)

						local bWidth = math.abs(w * boostValue)
						surface.DrawRect(2 + w * value - bWidth, 2, bWidth, h)

						surface.SetDrawColor(255, 255, 255, 35)
						surface.SetMaterial(gradient)
						surface.DrawTexturedRect(2 + w * value - bWidth, 2, bWidth, h)
					else
						surface.SetDrawColor(40, 200, 40, 230)
						surface.DrawRect(2 + w * value, 2, w * boostValue, h)

						surface.SetDrawColor(255, 255, 255, 35)
						surface.SetMaterial(gradient)
						surface.DrawTexturedRect(2 + w * value, 2, w * boostValue, h)
					end
				end
				end
			end

            surface.SetDrawColor( Color(0, 95, 79) )
            surface.DrawRect(w-2,0,2,h)

		end

        

	end

	function PANEL:Think()
		if (self.pressing) then
			if ((self.nextPress or 0) < CurTime()) then
				self:doChange()
			end
		end

		self.deltaValue = math.Approach(self.deltaValue, self.value, FrameTime() * 15)
	end

	function PANEL:doChange()
		if ((self.value == 0 and self.pressing == -1) or (self.value == self.max and self.pressing == 1)) then
			return
		end
		
		self.nextPress = CurTime() + 0.2
		
		if (self:onChanged(self.pressing) != false) then
			self.value = math.Clamp(self.value + self.pressing, 0, self.max)
		end
	end

	function PANEL:onChanged(difference)
	end

	function PANEL:getValue()
		return self.value
	end

	function PANEL:setValue(value)
		self.value = value
	end

	function PANEL:setBoost(value)
		self.boostValue = value
	end

	function PANEL:setMax(max)
		self.max = max
	end


	function PANEL:setReadOnly()
	end
vgui.Register("nutMenuAttribBar", PANEL, "DPanel")