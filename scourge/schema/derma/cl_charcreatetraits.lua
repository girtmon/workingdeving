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
													<img src="https://i.imgur.com/vRzpdDL.png" width="]] .. ScrW() .. [[" height="]] .. ScrH() .. [[" />
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

	function PANEL:addLabel(text)
		local label = self:Add("DLabel")
		label:SetPos(self.lastX, self.lastY)
		label:SetFont("nutMenuButtonFont")
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



	function PANEL:setUp(faction)
		self.faction = faction

		self.modelD = nil
		
		
		for k, v in SortedPairsByMemberValue(nut.char.vars, "index") do
			if (!v.noDisplay and k != "__SortedIndex") then
			
				--these are ignored so we can draw them elsewhere
				if(v.field == "_name") then continue end
				if(v.field == "_desc") then continue end
                if (v.field == "_model") then continue end

				if(v.field == "_attribs") then
					continue
				end
				


			
				if (v.shouldDisplay) then
					if (v.shouldDisplay(self) == false) then
						continue
					end
				end

				--self:addLabel(k)

				if (v.onDisplay) then
					
					local panel = v.onDisplay(self, self.lastY)

                    panel:SetTall(ScrH() / 3 )
                    panel:SetPos(ScrW() / 2 - panel:GetWide() / 2, ScrH() / 2 - panel:GetTall() / 2)
					

					if (IsValid(panel)) then
						self.lastY = self.lastY + panel:GetTall() + 8

						self.modelD = panel

						if (v.onPostSetup) then
							v.onPostSetup(panel, faction, self.payload)
								
						end
						
					end
				elseif (type(v.default) == "string") then
					local textBox = self:addTextBox()
					textBox.OnTextChanged = function(this)
						self.payload[k] = this:GetText()
					end

					if (v.onPostSetup) then
						v.onPostSetup(textBox, faction, self.payload)
					end
				end
			end
		end

		self:AddCancelButton("Cancel", function ()
			for k, v in pairs(self:GetParent():GetParent():GetParent():GetParent():GetParent().fadePanels) do
														if (IsValid(v)) then
															v:AlphaTo(0, 0.25, 0, function()
																v:Remove()
															end)
														end
													end

			self:GetParent():GetParent():GetParent():GetParent():GetParent():Remove()
			vgui.Create("nutCharMenu")
		end)

    	self:AddNextButton("Next", function ()		

			// completed - now send to server or some shit
			local payload = {}

            self.payload.faction = self.faction


			for k, v in SortedPairsByMemberValue(nut.char.vars, "index") do
				local value = self.payload[k]
				if (!v.noDisplay or v.onValidate) then
					if (v.onValidate) then
						local result = {v.onValidate(value, self.payload, LocalPlayer())}
						if (result[1] == false) then
							self.notice:SetVisible(true)
							self.notice:setType(1)
							self.notice:setText(L(unpack(result, 2)).."!")

							return
						end
					end

					payload[k] = value
				end
			end

            netstream.Hook("charAuthed", function(fault, ...)
													timer.Remove("nutCharTimeout")
	
													if (type(fault) == "string") then
														self.notice:setType(1)
														self.notice:setText(L(fault, ...))
														self.creating = nil
	
														return
													end
	
													if (type(fault) == "table") then
														nut.characters = fault
													end

													for k, v in pairs(self:GetParent():GetParent():GetParent():GetParent():GetParent().fadePanels) do
														if (IsValid(v)) then
															v:AlphaTo(0, 0.25, 0, function()
																v:Remove()
															end)
														end
													end
	
													self:GetParent():GetParent():GetParent():GetParent():GetParent().fadePanels = {}
													self:GetParent():GetParent():GetParent():GetParent():GetParent():Remove()
													vgui.Create("nutCharMenu")
												end)

												
	
												timer.Create("nutCharTimeout", 20, 1, function()
													if (IsValid(self) and self.creating) then
														self.notice:setType(1)
														self.notice:setText(L"unknownError")
														self.creating = nil
													end
												end)

                                                
												
                                                
	
												netstream.Start("charCreate", payload)





            



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
vgui.Register("nutCharCreateTraits", PANEL, "DScrollPanel")