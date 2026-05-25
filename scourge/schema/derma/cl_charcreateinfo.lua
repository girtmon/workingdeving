local PANEL = {}
	function PANEL:Init()

		nut.gui.charCreate = self

        

		self.schemaBG = self:Add("DHTML")
		self.schemaBG:SetPos(0,0)
		self.schemaBG:SetSize(ScrW(), ScrH())
		self.schemaBG:SetZPos(-197)
		self.schemaBG:SetHTML([[
											<html>
												<body style="margin: 0; padding: 0; overflow: hidden;">
													<img src="https://i.imgur.com/vRzpdDL.pngg" width="]] .. ScrW() .. [[" height="]] .. ScrH() .. [[" />
												</body>
											</html>
										]])

		self:SetSize(ScrW(), ScrH())
		self:SetPos(0,0)

        self.notice = self:Add("nutNoticeBar")
		self.notice:setType(4)
		self.notice:setText(L"charCreateTip")
		self.notice:SetWide(self:GetWide())
		self.notice:SetVisible(false)

		

		self.payload = {}
		self.lastY = ScrH() / 7
		self.lastX = ScrW() / 2
	end

	function PANEL:addLabel(text, x, y)
		local label = self:Add("DLabel")
		label:SetPos(x, y)
		label:SetFont("cpFont")
		label:SetText(L(text))
		label:SizeToContents()
		label:SetTextColor(color_white)
		label:SetExpensiveShadow(2, Color(0, 0, 0, 200))

		self.lastY = self.lastY + label:GetTall() + 8

		return label
	end

	function PANEL:AddNextButton(text, callback)
		local label = self:Add("nutMenuButton")
		label:SetSize(300, 40)
		label:SetPos(ScrW() - 350, ScrH() - 50 )
		label:SetText(text)
		label.DoClick = function () callback() end
	end

	function PANEL:AddCancelButton(text, callback)
		local label = self:Add("nutMenuButton")
		label:SetSize(300, 40)
		label:SetPos(150, ScrH() - 50 )
		label:SetText(text)
		label.DoClick = function () callback() end
	end

	function PANEL:addTextBox()
		local textBox = self:Add("DTextEntry")
		textBox:SetFont("cpFont")
		textBox:SetWide(ScrW() * 0.3)
		textBox:SetPos(self.lastX, self.lastY)
		textBox:SetTall(36)

		self.lastY = self.lastY + textBox:GetTall() + 8
		
		return textBox
	end


	function PANEL:setUp(faction)

            self.faction = faction

			local preview = self:Add("DModelPanel")
											
			preview:SetPos(ScrW() * 0.55, ScrH() * 0.1)			// Set the position
			preview:SetSize(ScrW() * 0.4, ScrH()*0.80)		// Set the size

			function preview:LayoutEntity(ent) // dont rotate
				
			end					
							
			preview:SetModel(self.payload.model)

	        for k, v in SortedPairsByMemberValue(nut.char.vars, "index") do
			if (!v.noDisplay and k != "__SortedIndex") then
			
				--these are ignored so we can draw them elsewhere
				if(v.field == "_model") then continue end

				if(v.field == "_traits") then
					continue
				end


			
				if (v.shouldDisplay) then
					if (v.shouldDisplay(self) == false) then
						continue
					end
				end

				

				if (v.onDisplay) then
					
					local panel = v.onDisplay(self, self.lastY)

					panel:SetPos(ScrW() / 5, 600)
					

					if (IsValid(panel)) then

						self.lastY = self.lastY + panel:GetTall() + 8

						if (v.onPostSetup) then
							v.onPostSetup(panel, faction, self.payload)
						end
					end
				elseif (type(v.default) == "string") then
					local textBox = self:addTextBox()
                    textBox:SetPos(ScrW() / 5, 200 + self.lastY)

                    self:addLabel(k, ScrW() / 5, 160 + self.lastY)

                    
					textBox.OnTextChanged = function(this)
						self.payload[k] = this:GetText()
					end

					if (v.onPostSetup) then
						v.onPostSetup(textBox, faction, self.payload)
					end
				end
				end
			end

        self:AddNextButton("Next", function ()	

			if !self.payload.desc or string.len(self.payload.desc) < 16 then
				self.notice:SetVisible(true)
				self.notice:setType(1)
				self.notice:setText("The description needs to have atleast 16 characters!")
				return
			end

			// traits section
            self.charCreateTraits = self:Add("nutCharCreateTraits")
            self.charCreateTraits.payload = self.payload
			self.charCreateTraits:setUp(self.faction)
            

		end)
		
		self:AddCancelButton("Cancel", function ()


			for k, v in pairs(self:GetParent():GetParent():GetParent().fadePanels) do
														if (IsValid(v)) then
															v:AlphaTo(0, 0.25, 0, function()
																v:Remove()
															end)
														end
													end

			self:GetParent():GetParent():GetParent():Remove()
			vgui.Create("nutCharMenu")
		end)

		-- --attribute panel
		-- local attribs = nut.char.vars.attribs

		-- self.lastX = ScrW() * 0.5
		-- self.lastY = self.notice:GetTall() + 8
		
		-- self:addLabel("attribs")
					
		-- local panel = attribs.onDisplay(self, self.lastY)

		-- if (IsValid(panel)) then
		-- 	self.lastY = self.lastY + panel:GetTall() + 8

		-- 	if (attribs.onPostSetup) then
		-- 		attribs.onPostSetup(panel, faction, self.payload)
		-- 	end
		-- end

		-- --trait panel
		-- local traits = nut.char.vars.traits

		-- self.lastX = ScrW() * 0.5
		-- self.lastY = self.lastY + 20
		
		-- self:addLabel("Traits")
					
		-- local panel = traits.onDisplay(self, self.lastY)

		-- if (IsValid(panel)) then
		-- 	self.lastY = self.lastY + panel:GetTall() + 8

		-- 	if (traits.onPostSetup) then
		-- 		traits.onPostSetup(panel, faction, self.payload)
		-- 	end
		-- end
	end
vgui.Register("nutCharCreateInfo", PANEL, "DScrollPanel")