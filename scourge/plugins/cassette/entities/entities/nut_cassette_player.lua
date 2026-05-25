ENT.Type = "anim"
ENT.PrintName = "Cassette Player"
ENT.Category = "NutScript"
ENT.Author = "Thermadyle"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.data = {
	insert_delay = 1,
	click_delay = 0.5,
	buttons = {
		{
			text = "PREV",
			GetPos = function(self, width, height, display)
				return 
					display.btn_padding, 
					display.height - display.btn_padding - height
			end,
			OnClick = function(self, ent)
				ent:AdvanceSongKey(true)
			end
		},
		
		{
			text = "NEXT",
			GetPos = function(self, width, height, display)
				return 
					display.width - width - display.btn_padding, 
					display.height - display.btn_padding - height
			end,
			OnClick = function(self, ent)
				ent:AdvanceSongKey()
			end
		},
		
		{
			GetText = function(self, ent)
				local song, key = ent.active_song, ent:getNetVar("SongKey")
				return (ent:getNetVar("CassetteKey") == 0 and "----") or
					((ent:getNetVar("Playing") and song and song.key == key) and "STOP") or "PLAY"
			end,
			GetPos = function(self, width, height, display)
				return 
					(display.width / 2) - (width / 2),
					display.height - display.btn_padding - height
			end,
			OnClick = function(self, ent)
				local song, key = ent.active_song, ent:getNetVar("SongKey")
				if ent:getNetVar("Playing") and (not song or song.key == key) then
					ent:Play(false)
				else
					ent:Play(true)
				end
			end
		},
		
		{
			GetText = function(self, ent)
				local data = ent:GetData()
				return string.format("EJECT> %s", (data and data.name) or "----")
			end,
			GetPos = function(self, width, height, display)
				return display.btn_padding, display.btn_padding
			end,
			OnClick = function(self, ent)
				ent:EjectCassette()
			end
		}
	}
}

function ENT:GetData()
	local key = self:getNetVar("CassetteKey")
	return SCHEMA.t_cassette[key]
end

function ENT:GetSongData()
	local data = self:GetData()
	if data then
		local key = self:getNetVar("SongKey")
		return data.playlist[key]
	end
end

function ENT:GetCassettePos(bEject)
	local ang = self:GetAngles()
	local pos = self:GetPos() +
	(ang:Right() * -6.5) + (ang:Up() * 3.55) +
	(ang:Forward() * ((bEject and -3.25) or -1.5))
	return pos, ang
end

function ENT:CanClick()
	return not self.next_click or self.next_click < SysTime()
end

if (SERVER) then
	netstream.Hook("sendEntInfo", function(client, ent, key)
		local data = ent.data
		data.buttons[key].OnClick(ent, ent)
	end)

	function ENT:SpawnFunction(player, trace)
		if (!trace.Hit) then return end

		local entity = ents.Create("nut_cassette_player")
		entity:Spawn()
		entity:Activate()
		entity:SetPos( trace.HitPos + trace.HitNormal * 32 + Vector(0, 0, 53) )
		entity:SetAngles( Angle(0, 0, 0) )

		return entity
	end

	-- A function to set the entity's item table.
	function ENT:SetItemTable(itemTable)
		self.cwItemTable = itemTable
	end

	function ENT:Initialize()
		self:SetModel("models/props_lab/citizenradio.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:PhysWake()
		
		self:setNetVar("CassetteKey", 0)
		self:setNetVar("SongKey", 1)
		self:setNetVar("Playing", false)
	end

	function ENT:Touch(ent)
		if not self.next_insert or self.next_insert < SysTime() then
			if (ent:GetClass() == "nut_item") and self:getNetVar("CassetteKey") == 0 then
				local itemTable = ent:getItemTable()

				if (itemTable and itemTable.isCassette) then
					self:setNetVar("CassetteKey", itemTable.key)
					self.cassette_class = itemTable.uniqueID
					ent:Remove()

					nut.plugin.list["cassette"]:SaveCassettes()
				end
			end
		end
	end

	function ENT:EjectCassette()
		if self:getNetVar("CassetteKey") ~= 0 then
			local pos, ang = self:GetCassettePos(true)
			local f = self:GetForward()
			local itemPosition = pos + f*19
			nut.item.spawn(self.cassette_class, itemPosition)
			
			self:Play(false)
			self:setNetVar("SongKey", 1)
			self:setNetVar("CassetteKey", 0)
			nut.plugin.list["cassette"]:SaveCassettes()
			
			self.next_insert = SysTime() + self.data.insert_delay
		end
	end

	function ENT:Think()
		local time = SysTime()
		if self.next_song and self.next_song < time then
			self:AdvanceSongKey()
			self:Play(true)
		end
	end

	function ENT:AdvanceSongKey(bNegative)
		local data = self:GetData()
		if data then
			local key, count = self:getNetVar("SongKey"), #data.playlist
			key = key + ((bNegative and -1) or 1)
			key = (key > count and 1) or (key < 1 and count) or key
			self:setNetVar("SongKey", key)
		end
	end

	function ENT:Play(bPlay, pl)
		local data = self:GetSongData()
		if data then
			self:setNetVar("Playing", bPlay)
			self.next_song = (bPlay and SysTime() + data.length)
			self.active_song = (bPlay and data)
			
			net.Start("tcp_play")
			net.WriteEntity(self)
			net.WriteBit(bPlay)
			if pl then
				net.Send(pl)
			else
				net.SendPVS(self:GetPos())
			end
		end
	end
else
	ENT.data.display = {
		cam_scale = 0.03125,
		width = 398,
		height = 256,
		
		bg_color = Color(35, 45, 35),
		bg_control_color = Color(30, 36, 28),
		bg_selection_color = Color(23, 31, 20),
		br_color = color_black,
		
		text_color = Color(195, 210, 190),
		title_color = color_white,
		
		btn_padding = 8,
		btn_inr_padding = 4,
		btn_hl_color = color_white
	}

	local display = ENT.data.display
	local buttons = ENT.data.buttons

	function ENT:Initialize()
		local ent = ents.CreateClientProp()
		ent:SetModel("models/props_phx2/garbage_metalcan001a.mdl")
		ent:SetNoDraw(true)
		self.cassette_ent = ent
		
		local name = string.format("tcp_display_%d", self:EntIndex())
		self.rendertarget = GetRenderTarget(name, display.width, display.height)
		self.display_material = CreateMaterial(name, "UnlitGeneric", {
			["$basetexture"] = name
		})
	end

	function ENT:Think()
		local time = SysTime()
		if not self.next_move_check or self.next_move_check < time then
			local channel = self.channel
			if IsValid(channel) then
				local pos = self:GetPos()
				if pos ~= self.last_pos then
					channel:SetPos(pos)
					self.last_pos = pos
				end
			end
			self.next_move_check = time + 0.25
		end
	end

	function ENT:GetCursorPos()
		local pl = LocalPlayer()
		local pos, ang = self:GetDisplayPos()
		local intrPos = util.IntersectRayWithPlane(pl:GetShootPos(), pl:GetAimVector(), pos, ang:Up())
		if intrPos then
			local offset = WorldToLocal(intrPos, ang, pos, ang)
			local x, y = offset.x * (1 / display.cam_scale), -offset.y * (1 / display.cam_scale)
			return {x = x, y = y}
		end
	end

	function ENT:GetDisplayPos()
		local ang = self:GetAngles()
		local pos = self:GetPos() + (ang:Up() * 12) + (ang:Forward() * 10)

		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		return pos, ang
	end

	function ENT:GetButtonData()
		local data = {}
		local cursorPos = self:GetCursorPos()
		surface.SetFont("CassettePlayer")
		for _, btn in pairs(self.data.buttons) do
			local text = btn.text or btn:GetText(self)
			local textWidth, textHeight = surface.GetTextSize(text)
			local width = textWidth + (display.btn_inr_padding * 2)
			local height = textHeight + (display.btn_inr_padding * 2)
			local x, y = btn:GetPos(width, height, display)
			table.insert(data, {
				x = x, y = y,
				width = width, height = height,
				button = btn,
				hasfocus = cursorPos and 
					(cursorPos.x >= x and cursorPos.x <= x + width) and
					(cursorPos.y >= y and cursorPos.y <= y + height)
			})
		end
		return data
	end

	function ENT:Play()
		self:Stop()
		local data = self:GetSongData()
		if data then
			self.active_song = nil
			self.active_url = data.url
			sound.PlayURL(data.url, "3d noplay", function(channel)
				if IsValid(channel) and self.active_url == data.url and data == self:GetSongData() then
					self.channel = channel
					self.start_time = SysTime()
					self.active_song = data
					
					channel:SetPos(self:GetPos())
					channel:Play()
				end
			end)
		end
	end

	function ENT:Stop()
		local channel = self.channel
		if IsValid(channel) then
			channel:Stop()
			self.channel = nil
		end
	end

	function ENT:OnRemove()
		self:Stop()
	end

	-- Render
	function ENT:DrawDisplay()
		local width, height = display.width, display.height
		surface.SetDrawColor(display.bg_color)
		surface.DrawRect(0, 0, width, height)
		
		local fontHeight = draw.GetFontHeight("CassettePlayer")
		local barHeight = fontHeight + (display.btn_padding * 2) + 
		(display.btn_inr_padding * 2)
		
		surface.SetDrawColor(display.bg_control_color)
		surface.DrawRect(0, 0, width, barHeight)
		surface.DrawRect(0, height - barHeight, width, barHeight)
		
		surface.SetDrawColor(display.bg_selection_color)
		surface.DrawRect(0, height - (barHeight * 2), width, barHeight)
		
		surface.SetFont("CassettePlayer")
		surface.SetTextColor(display.text_color)
		for k, data in pairs(self:GetButtonData()) do
			local x, y = data.x, data.y
			local width, height = data.width, data.height
			
			surface.SetTextPos(x + display.btn_inr_padding, y + display.btn_inr_padding)
			surface.DrawText(data.button.text or data.button:GetText(self))
			
			if data.hasfocus and self:CanClick() then
				surface.SetDrawColor(display.btn_hl_color)
				surface.DrawOutlinedRect(x, y, width, height)

				if LocalPlayer():KeyPressed(IN_USE) then
					netstream.Start("sendEntInfo", self, k)
				end
			end
		end
		
		if self:getNetVar("Playing") then
			local song = self.active_song
			local text = (song and song.name) or "LOADING" 
			local textWidth, textHeight = surface.GetTextSize(text)
			local x = (width / 2) - (textWidth / 2)
			local y = (height / 2) - (fontHeight / 2) - (barHeight / 2)
			
			surface.SetTextPos(x, y)
			surface.SetTextColor(display.title_color)
			surface.DrawText(text)
			
			local channel = self.channel
			if IsValid(channel) then
				surface.SetDrawColor(display.bg_control_color)
				surface.DrawRect(x - 4, y + textHeight + 4, textWidth + 8, 6)
			
				local prog = math.min((SysTime() - self.start_time) / channel:GetLength(), 1)
				surface.SetDrawColor(color_white)
				surface.DrawRect(x - 3, y + textHeight + 5, (textWidth + 6) * prog , 4)
			end
		end
		
		local data = self:GetSongData()
		if data then
			local text = string.format("%d> %s", self:getNetVar("SongKey"), data.name)
			local textWidth, textHeight = surface.GetTextSize(text)
			surface.SetTextPos((width / 2) - (textWidth / 2), height - barHeight - fontHeight - display.btn_padding - display.btn_inr_padding) -- Tower
			surface.SetTextColor(display.text_color)
			surface.DrawText(text)
		end
		
		surface.SetDrawColor(display.br_color)
		surface.DrawOutlinedRect(0, 0, width, height)
	end

	function ENT:UpdateMaterial()
		render.PushRenderTarget(self.rendertarget)
		render.Clear(0, 0, 0, 0)
		cam.Start2D()
		self:DrawDisplay()
		cam.End2D()
		render.PopRenderTarget()
	end

	function ENT:DrawCassette()
		local ent = self.cassette_ent
		if IsValid(ent) then
			local pos, ang = self:GetCassettePos()
			ent:SetRenderOrigin(pos)
			ent:SetRenderAngles(ang)
			ent:DrawModel()
		end
	end

	function ENT:Draw()
		self:DrawModel()
		if self:getNetVar("CassetteKey") ~= 0 then
			self:DrawCassette()
		end
		
		self:UpdateMaterial() -- Should really only be updated when the display changes, but that is for another day. :~)
		local pos, ang = self:GetDisplayPos()
		cam.Start3D2D(pos, ang, display.cam_scale)
			surface.SetMaterial(self.display_material)
			surface.SetDrawColor(color_white)
			surface.DrawTexturedRect(0, 0, display.width, display.height)
		cam.End3D2D()
	end
end