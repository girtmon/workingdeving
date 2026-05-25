local function VScale(a) return a * (ScrH() / 480.0) end; local function SScaleMin(a) return math.min(SScale(a), VScale(a)) end
local __convars__ = {}

local PANEL = {}
DEFINE_BASECLASS('DFrame')

local function _stress(panel, cb, title, sts, convars, realpanel, nameOcclusion)
    panel.DoClick = function(this)
        surface.PlaySound('ui/buttonclick.wav')
        if cb then cb(this) end
    end
    panel.DoRightClick = function(this)
        realpanel:CreateOptionsPanel(convars, title, nameOcclusion)
    end
    panel.Paint = function(this, w, h)
        surface.SetDrawColor(66, GetConVar(sts):GetBool() && 166 || 66, 66, 166)
        surface.DrawRect(0, 0, w, h)

        draw.DrawText(title, "TargetID", w/2, h/3.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end

function PANEL:Init()
    if IsValid(nut.gui.postprocess) then
        nut.gui.postprocess:Remove()
    end
    nut.gui.postprocess = self; __convars__ = {}
    self:SetSize(SScale(320 / 3), VScale(620 / 3))
    self:Center()

    self:MakePopup()
    self:ShowCloseButton(true)

    self:SetTitle('Post Process')

    self.scroll = self:Add('DScrollPanel')
    self.scroll:Dock(FILL)

    self:AddOption('Extra Vignette', function(this)
        GetConVar('nut_extravignette'):SetBool( !GetConVar('nut_extravignette'):GetBool() )
    end, 'nut_extravignette', {
        ['pp_vignette_constant'] = 1,
        ['pp_vignette_underwater'] = 1,
        ['pp_vignette_ceiling'] = 1,
        ['pp_vignette_lights'] = 1,
        ['pp_vignette_passes'] = 2,
        ['pp_vignette_alpha'] = 255,
        ['pp_vignette_maxalpha'] = 255
    },"pp_vignette_")

    self:AddOption('Motion Blur', function(this)
        GetConVar('pp_motionblur'):SetBool( !GetConVar('pp_motionblur'):GetBool() )
    end, 'pp_motionblur', {
        ['pp_motionblur_addalpha'] = 0.2,
        ['pp_motionblur_drawalpha'] = 0.99,
        ['pp_motionblur_delay'] = 0.05
    },"pp_motionblur_")

    self:AddOption('Bloom', function(this)
        GetConVar('pp_bloom'):SetBool( !GetConVar('pp_bloom'):GetBool() )
    end, 'pp_bloom', {
        ['pp_bloom_darken'] = 0.65,
        ['pp_bloom_multiply'] = 1.0,
        ['pp_bloom_sizex'] = 4.0,
        ['pp_bloom_sizey'] = 4.0,
        ['pp_bloom_color'] = 2.0,
        ['pp_bloom_color_r'] = 255,
        ['pp_bloom_color_g'] = 255,
        ['pp_bloom_color_b'] = 255,
        ['pp_bloom_passes'] = 4
    },"pp_bloom_")

    self:AddOption('Toy Town', function(this)
        GetConVar('pp_toytown'):SetBool( !GetConVar('pp_toytown'):GetBool() )
    end, 'pp_toytown', {
        ['pp_toytown_passes'] = 3,
        ['pp_toytown_size'] = 0.4
    },"pp_toytown_")

    self:AddOption('Sun Beams', function(this)
        GetConVar('pp_sunbeams'):SetBool( !GetConVar('pp_sunbeams'):GetBool() )
    end, 'pp_sunbeams', {
        ['pp_sunbeams_darken'] = 0.95,
        ['pp_sunbeams_multiply'] = 1.0,
        ['pp_sunbeams_sunsize'] = 0.075
    },"pp_sunbeams_")

    self:AddOption('Color Correction', function(this)
        GetConVar('pp_colormod'):SetBool( !GetConVar('pp_colormod'):GetBool() )
    end, 'pp_colormod', {
        ['pp_colormod_addr'] = 1,
        ['pp_colormod_addg'] = 1,
        ['pp_colormod_addb'] = 1,
        ['pp_colormod_brightness'] = 1,
        ['pp_colormod_contrast'] = 1,
        ['pp_colormod_color'] = 1,
        ['pp_colormod_mulr'] = 1,
        ['pp_colormod_mulg'] = 1,
        ['pp_colormod_mulb'] = 1
    },"pp_colormod_")
	
	self:AddOption('PS1 Shader', function(this)
        GetConVar('pp_fz_ps1_shader_enable'):SetBool( !GetConVar('pp_fz_ps1_shader_enable'):GetBool() )
    end, 'pp_fz_ps1_shader_enable', {
		['pp_fz_ps1_shader_seffect_vhs_en_0'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_1'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_2'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_ca'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_r_layer'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_g_layer'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_b_layer'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_offs_r_x'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_offs_r_y'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_offs_g_x'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_offs_g_y'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_offs_b_x'] = 1,
		['pp_fz_ps1_shader_seffect_vhs_en_offs_b_y'] = 1,
		['pp_fz_ps1_shader_effect_x_size'] = 1,
		['pp_fz_ps1_shader_effect_y_size'] = 1,
		['pp_fz_ps1_shader_effect_lerpspeed'] = 1,
		['pp_fz_ps1_shader_effect_maxsize'] = 1,
    }, "pp_fz_ps1_shader_")

    self:AddOption('Sobel', function(this)
        GetConVar('pp_sobel'):SetBool( !GetConVar('pp_sobel'):GetBool() )
    end, 'pp_sobel', {
        ['pp_sobel_threshold'] = 0.11
    },"pp_sobel_")

    self:AddOption('Sharpen', function(this)
        GetConVar('pp_sharpen'):SetBool( !GetConVar('pp_sharpen'):GetBool() )
    end, 'pp_sharpen', {
        ['pp_sharpen_contrast'] = 1,
        ['pp_sharpen_distance'] = 1
    },"pp_sharpen_")

    self:AddOption('Hide all HUD', function(this)
        GetConVar('nut_hidehud'):SetBool( !GetConVar('nut_hidehud'):GetBool() )
    end, 'nut_hidehud', {})

    self.accept = self:Add('DButton')
    self.accept:SetSize(self:GetWide(), VScale(15))
    self.accept:Dock(BOTTOM)
    self.accept:DockMargin(1, 1, 1, 1)
    self.accept:SetContentAlignment(6)
    self.accept:SetText('')
    self.accept.Paint = function(this, w, h)
        surface.SetDrawColor(66, 66, 66, 166)
        surface.DrawRect(0, 0, w, h)
        draw.DrawText('BROADCAST', "TargetID", w/2, h/3.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    self.accept.DoClick = function()
        surface.PlaySound('buttons/button16.wav')
        net.Start('nutUpdatePostProcessReceive')
			local retrievedConvars = {}
			
			for k,v in pairs(__convars__) do
				retrievedConvars[k] = GetConVar(k):GetInt()
			end
            
			net.WriteTable(retrievedConvars)
        net.SendToServer()
    end
end

function PANEL:AddOption(title, cb, sts, convars, nameOcclusion)
    local option = self.scroll:Add('DButton')
    option:SetSize(self:GetWide(), VScale(15))
    option:Dock(TOP)
	option:DockMargin(0, 0, 0, VScale(5 / 3))
    option:SetContentAlignment(5)
    option:SetText('')
    _stress(option, cb, title, sts, convars, self, nameOcclusion)

    for k, v in pairs(convars) do
        __convars__[k] = v
    end
end

function PANEL:CreateOptionsPanel(convars, title, nameOcclusion)
    if IsValid(self.settingspanel) then self.settingspanel:Remove() end
    local panel = vgui.Create('DFrame')
    panel:SetSize(SScale(400 / 3), VScale(920 / 3))
    panel:Center()
    panel:SetPos(panel:GetX()+SScale(350 / 3), panel:GetY())
    panel:SetTitle('Settings - '..title)
    panel:MakePopup()
    self.settingspanel = panel
    for k, v in pairs(convars) do
        local slider = panel:Add('DNumSlider')
        slider:Dock(TOP)
        slider:DockMargin(0, 0, 0, VScale(5 / 3))
        slider:SetText(nameOcclusion != nil and string.Replace(k,nameOcclusion,"") or k)
        slider:SetMin(0); slider:SetMax(v)
        slider:SetDecimals(1)
        slider:SetConVar(k)
    end
end

function PANEL:OnKeyCodePressed(keyCode)
    if keyCode == KEY_F2 then
        BaseClass.Remove(self)
    end
end

function PANEL:Remove()
    if IsValid(self.settingspanel) then
        self.settingspanel:Remove()
    end
    BaseClass.Remove(self)
end

vgui.Register('nutSettings', PANEL, 'DFrame')