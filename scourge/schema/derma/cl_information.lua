surface.CreateFont("cpFont", {
	font = "Times New Roman",
	size = 28
})

surface.CreateFont("cpFontM", {
	font = "Times New Roman",
	size = 22
})

surface.CreateFont("cpFontMB", {
	font = "Times New Roman",
	size = 22
})

surface.CreateFont("cpFontS", {
	font = "Times New Roman",
	size = 16
})

surface.CreateFont("cpFontSB", {
	font = "Times New Roman",
	size = 16
})

surface.CreateFont("cpFontSs", {
	font = "Times New Roman",
	size = 14
})

surface.CreateFont("cpFontB", {
	font = "Times New Roman",
	size = 40
})

surface.CreateFont("cpFontBs", {
	font = "Times New Roman",
	size = 34
})
//Times New Roman

function draw.OutlinedBox( x, y, w, h, thickness )
	for i=0, thickness - 1 do
		surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
	end
end



local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.info)) then
			nut.gui.info:Remove()
		end

		nut.gui.info = self

		self:SetSize(ScrW(), ScrH() * 0.9)
		self:Center()

		local suppress = hook.Run("CanCreateCharInfo", self)

		if (!suppress or (suppress and !suppress.all)) then
			
			if (!suppress or !suppress.model) then
				self.model = self:Add("nutModelPanel")
				self.model:SetWide(ScrW() * 0.3)
				self.model:Dock(RIGHT)
				self.model:SetFOV(50)
				self.model.enableHook = true
				self.model.copyLocalSequence = true
				self.model:DockMargin(0, 0,60,80)
			end

			if (!suppress or !suppress.faction) then
				self.faction = self.model:Add("DLabel")
				self.faction:Dock(TOP)
				self.faction:SetFont("cpFont")
				self.faction:SetTextColor(Color(169, 0, 16))
				self.faction:SetExpensiveShadow(1, Color(0, 0, 0, 150))
				self.faction:DockMargin(ScrW() * 0.06, ScrH() * 0.73, 0, 0)
			end

			if (!suppress or !suppress.info) then
				self.info = self:Add("DPanel")
				self.info:SetWide(ScrW() * 0.4)
				self.info:Dock(RIGHT)
				self.info:SetDrawBackground(false)
				self.info:DockMargin(0, ScrH() * 0.04, ScrW() * 0.25, 0) // Left, Top, Right, Bottom
			end


			

			if (!suppress or !suppress.name) then
				self.name = self.info:Add("DLabel")
				self.name:SetFont("cpFontB")
				self.name:SetTall(60)
				self.name:Dock(TOP)
				self.name:SetTextColor(Color(169, 0, 16))
				self.name:SetExpensiveShadow(1, Color(0, 0, 0, 150))
			end

			if (!suppress or !suppress.desc) then
				self.desc = self.info:Add("DTextEntry")
				self.desc:Dock(TOP)
				self.desc:SetFont("cpFont")
				self.desc:DockMargin(0,-10,3,0)
				self.desc:SetTextColor(Color(169, 0, 16))
				self.desc:SetExpensiveShadow(1, Color(0, 0, 0, 150))
				self.desc:SetTall(28)
				self.desc:SetDrawBackground(false)
			end

			if (!suppress or !suppress.money) then
				self.money = self.info:Add("DLabel")
				self.money:Dock(TOP)
				self.money:SetFont("cpFont")
				self.money:SetTextColor(Color(169, 0, 16))
				self.money:SetExpensiveShadow(1, Color(0, 0, 0, 150))
				self.money:DockMargin(0, 2, 0, 0)
			end

			

			if (!suppress or !suppress.class) then
				local class = nut.class.list[LocalPlayer():getChar():getClass()]
				
				if (class) then
					self.class = self.info:Add("DLabel")
					self.class:Dock(TOP)
					self.class:SetFont("nutMediumFont")
					self.class:SetTextColor(color_white)
					self.class:SetExpensiveShadow(1, Color(0, 0, 0, 150))
					self.class:DockMargin(0, 10, 0, 0)
				end
			end

			hook.Run("CreateCharInfoText", self)

			if (!suppress or !suppress.attrib) then
				self.attribName = self.info:Add("DLabel")
				self.attribName:Dock(TOP)
				self.attribName:SetFont("cpFont")
				self.attribName:SetTextColor(color_white)
				self.attribName:SetExpensiveShadow(1, Color(0, 0, 0, 150))
				self.attribName:DockMargin(0, 80, 0, 0)
				self.attribName:SetText("")

				self.attribs = self.info:Add("DScrollPanel")
				self.attribs:Dock(FILL)
				self.attribs:DockMargin(0, 10, 0, 0)
			end
		end

		hook.Run("CreateCharInfo", self)
	end

	function PANEL:setup()
		local char = LocalPlayer():getChar()
		if (self.desc) then
			self.desc:SetText(char:getDesc())
			self.desc.OnEnter = function(this, w, h)
				nut.command.send("chardesc", this:GetText())
			end
		end

		if (self.name) then
			self.name:SetText(LocalPlayer():Name())
			self.name.Think = function(this)
				this:SetText(LocalPlayer():Name())
			end
		end

		if (self.money) then
			self.money:SetText(L("charMoney", nut.currency.get(char:getMoney())))
		end

		if (self.faction) then
			self.faction:SetText("Member of the " .. team.GetName(LocalPlayer():Team()) .. " faction")
		end

		if (self.time) then
			local format = "%A, %d %B %Y %X"
			
			self.time:SetText(L("curTime", os.date(format, nut.date.get())))
			self.time.Think = function(this)
				if ((this.nextTime or 0) < CurTime()) then
					this:SetText(L("curTime", os.date(format, nut.date.get())))
					this.nextTime = CurTime() + 0.5
				end
			end
		end

		if (self.class) then
			local class = nut.class.list[char:getClass()]
			if (class) then
				self.class:SetText(L("charClass", L(class.name)))
			end
		end
		
		if (self.model) then
			self.model:SetModel(LocalPlayer():GetModel())
			self.model.Entity:SetSkin(LocalPlayer():GetSkin())

			for k, v in ipairs(LocalPlayer():GetBodyGroups()) do
				self.model.Entity:SetBodygroup(v.id, LocalPlayer():GetBodygroup(v.id))
			end

			local ent = self.model.Entity
			if (ent and IsValid(ent)) then
				local mats = LocalPlayer():GetMaterials()
				for k, v in pairs(mats) do
					ent:SetSubMaterial(k - 1, LocalPlayer():GetSubMaterial(k - 1))
				end
			end
		end

		local attributesCategories = {
			["dexterity"] = 1,
			["end"] = 1,
			["str"] = 1,

			["stm"] = 2,
			["arcane"] = 2,
			["fortitude"] = 2,

			["luck"] = 3,
			["karma"] = 3
		}

		local cats = {
			[1] = "COMBAT",
			[2] = "BODY",
			[3] = "AUXILARY"
		}

		if (self.attribs) then
			local boost = char:getBoosts()

			for i=1,3 do

				

				local entCatPanel = vgui.Create("DPanel", self.attribs)
				entCatPanel:Dock(TOP)
				entCatPanel:DockMargin(0,0,ScrW() / 10,8)
				entCatPanel:SetSize(ScrW() / 6, 120)
				entCatPanel.Paint = function (self,w,h)
					surface.SetDrawColor(Color(0, 95, 79))
					surface.DrawOutlinedRect(0,0,w,h,2)

					draw.OutlinedBox(7, 32, 80, 80, 2)

					surface.DrawLine(7, 32, 87, 112)
					surface.DrawLine(87, 32, 7, 112)

					surface.SetDrawColor(Color(0,0,0,60))
					surface.DrawRect(0,0,w,h)

					draw.SimpleText(cats[i], "cpFontMB", 4, 2, Color(169, 0, 16))

				end
				
			
				local categoryPanel = vgui.Create("DPanel", entCatPanel)
				categoryPanel:Dock(TOP)
				categoryPanel:DockMargin(0,25,0,0)
				categoryPanel:SetTall(95)
				categoryPanel.Paint = function (self,w,h)
					surface.SetDrawColor(Color(0, 95, 79))
					surface.DrawOutlinedRect(0,0,w,h,2)

					surface.SetDrawColor(Color(0,0,0,60))
					surface.DrawRect(0,0,w,h)
				end


				for k, v in SortedPairsByMemberValue(nut.attribs.list, "name") do

					if attributesCategories[k] != i then continue end

					local attribBoost = 0
					if (boost[k]) then
						for _, bValue in pairs(boost[k]) do
							attribBoost = attribBoost + bValue
						end
					end

					// Left, Top, Right, Bottom

					local attribValue = char:getAttrib(k, 0)
					local maximum = v.maxValue or nut.config.get("maxAttribs", 30)

					local bLabel = vgui.Create("DLabel", categoryPanel)
					bLabel:Dock(TOP)
					bLabel:DockMargin(93,9,(ScrW() / 5) * 0.2,1)
					bLabel:SetFont("cpFontSB")
					bLabel:SetText("")
					bLabel.Paint = function (self, w, h)
						draw.SimpleText(string.upper(string.sub(L(v.name), 1, 3)), "cpFontSB", 14, h/2, Color(169, 0, 16), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

						draw.SimpleText( attribValue , "cpFontSs", 55, h/2, Color(0, 224, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
					end

					local bar = vgui.Create("nutMenuAttribBar", bLabel)
					bar:Dock(FILL)
					bar:DockMargin(58,0,0,0)
					bar:SetTall(14)
					
				
					
					if (attribBoost) then
						bar:setValue(attribValue - attribBoost or 0)
					else
						bar:setValue(attribValue)
					end

					
					bar:setMax(maximum)
					--bar:setText(Format("%s [%.1f/%.1f] (%.1f", L(v.name), attribValue, maximum, attribValue/maximum*100) .. "%)")
				

					if (attribBoost) then
						bar:setBoost(attribBoost)
					end

				
				end

			end
		end

		hook.Run("OnCharInfoSetup", self)
	end

	function PANEL:Paint(w, h)
	end
vgui.Register("nutCharInfo", PANEL, "EditablePanel")