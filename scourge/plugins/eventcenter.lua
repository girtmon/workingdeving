PLUGIN.name = "Event Center Chat"
PLUGIN.author = "Pcwizdan"
PLUGIN.desc = "Event center chat - allows use of (Event Center Chat) /ecc <text> to submit event chat teletype animation to players"

nut.config.add("eventcenter", true, "Allow eventcenter chat in this server.", nil, {
	category = "server"
})

	local function isAllowed()
		return nut.config.get("eventcenter")
	end
	
	local function ChatCommandCallback(client,tblArgs)
		print("EventCenter attempted",client,table.concat(tblArgs," "))
		if !isAllowed() then return "@ EventCenter is disabled" end
		--if !client:IsAdmin() then return end
		local s = table.concat(tblArgs," ")
		net.Start("ecc_teletype")
			net.WriteString(s)
			net.WriteFloat(CurTime()) --hopefully float works with curtime
		net.Broadcast()
	end
	
	nut.command.add("ecc",{
		adminOnly=true,
		onRun = ChatCommandCallback
	})

if (SERVER) then
	util.AddNetworkString("ecc_teletype")

else --CLIENT

	surface.CreateFont("ECC_TT",{
		font = "Times New Roman",
		extended = false,
		size = 25,
		weight = 500,
		blursize = 0,
		scanlines = 1,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = true
	})
	local TT_LIST_ACTIVE = {}
	local TT_STARTY = ScrH()*.7
	local TT_ENDY = ScrH()*.9
	local TT_CENTERX = ScrW()/2
	
	--CUSTOMIZE STARTED
	local TT_TEXTDURATION = 30
	local TT_FADEINTIME = 1.5
	local TT_FADEOUTTIME = 5
	local TT_SCROLLTIME = 1.2
	local TT_TYPERATE = 0.1 --seconds per character teletyped #chars/typerate seconds to display whole string
	local TT_COLOR = Color(255,255,255,250)
	--CUSTOMIZE_ENDED
	
	local function ReceiveTeletype(len,pl)
		local t = {}
		t.text = net.ReadString()
		t.startTime = net.ReadFloat()
		t.endTime = t.startTime + TT_TEXTDURATION
		t.fadeoutTime = t.endTime - TT_FADEOUTTIME
		t.fadeinTime = t.startTime + TT_FADEINTIME
		t.scrolloutTime = t.endTime - TT_SCROLLTIME
		table.insert(TT_LIST_ACTIVE,t)
	end
	net.Receive("ecc_teletype",ReceiveTeletype)
	
	function PLUGIN:HUDPaint()
		if #TT_LIST_ACTIVE > 0 then
			--draw teletypes
			--nut.util.drawText("Drawing eventcenter messages",ScrW()/2,ScrH()/2,color_white,0,0)
			local curtime = CurTime()
			local yOffset = 0
			local th = 24
			local col = Color(TT_COLOR.r,TT_COLOR.g,TT_COLOR.b,TT_COLOR.a)
			for k, v in pairs(TT_LIST_ACTIVE) do
				if curtime > v.endTime then
					table.remove(TT_LIST_ACTIVE,k) --removing index test if table breaks order
				else
					--chat text
					textString = string.sub(v.text,1,math.min(math.floor((curtime - v.startTime)/TT_TYPERATE), string.len(v.text)))
					
					if curtime < v.fadeinTime then
						col.a = Lerp(math.min(1,(CurTime() - v.startTime)/TT_FADEINTIME),0,TT_COLOR.a)
					elseif curtime > v.fadeoutTime then
						local frac = math.min(1,(CurTime() - v.fadeoutTime)/TT_FADEOUTTIME)
						local frac2 = math.min(1,(CurTime() - v.scrolloutTime)/TT_SCROLLTIME)
						col.a = Lerp(frac,TT_COLOR.a,0)
						yOffset = yOffset + math.floor(Lerp(frac2,0,th))
					end
					draw.DrawText(textString,"ECC_TT",TT_CENTERX,TT_STARTY + k*th - yOffset,col,TEXT_ALIGN_CENTER)
					--net.util.drawText(v.text,TT_CENTERX,TT_STARTY+k*th,color_white,0,0)
				end
			end
		end
	end
end