local PLUGIN = PLUGIN
PLUGIN.name = 'Special Effects'
PLUGIN.author = 'Bilwin'

if CLIENT then
    CreateConVar('nut_extravignette', 0, {FCVAR_ARCHIVE, FCVAR_CLIENTDLL}, '', 0, 1)
    CreateConVar('nut_hidehud', 0, {FCVAR_ARCHIVE, FCVAR_CLIENTDLL}, '', 0, 1)

    local m = nut.util.getMaterial('robotboy655/vignette.png')
    local m_w = nut.util.getMaterial('robotboy655/vignette_white.png')
    local alpha_saved = 255

    local ConVars = {
        pp_vignette_constant = "0",
        pp_vignette_underwater = "0",
        pp_vignette_ceiling = "0",
        pp_vignette_lights = "0",
        pp_vignette_passes = "2",
        pp_vignette_alpha = "255",
        pp_vignette_maxalpha = "255",
    }

    for k, v in pairs( ConVars ) do
        CreateClientConVar( k, v )
    end

    function PLUGIN:RenderScreenspaceEffects()
        if not GetConVar('nut_extravignette'):GetBool() then return end
        if not render.SupportsPixelShaders_2_0() then return end

        local alpha = 0
        if ( GetConVarNumber( "pp_vignette_constant" ) >= 1 ) then
            alpha = GetConVarNumber( "pp_vignette_alpha" )
        end
    
        local alpha1 = 0
        if ( GetConVarNumber( "pp_vignette_underwater" ) >= 1 ) then
            local trace = util.TraceLine( {
                start = LocalPlayer():GetShootPos(),
                endpos = LocalPlayer():GetShootPos() + Vector( 0, 0, 32000 ),
                filter = { LocalPlayer() }
            } )
    
            local tr = util.TraceLine( {
                start = trace.HitPos,
                endpos = LocalPlayer():GetShootPos(),
                filter = { LocalPlayer() },
                mask = CONTENTS_WATER
            } )
            alpha1 = math.Clamp( tr.HitPos:Distance( LocalPlayer():GetShootPos() ) / 2, 0, 255 )
        end
        alpha1 = math.min( alpha1, GetConVarNumber( "pp_vignette_maxalpha" ) )
    
        local alpha2 = 0
        if ( GetConVarNumber( "pp_vignette_ceiling" ) >= 1 ) then
            local trace = util.TraceLine( {
                start = EyePos(),
                endpos = EyePos() + Vector( 0, 0, 32000 ),
                filter = { LocalPlayer():GetViewEntity() }
            } )
    
            local alpha = math.Clamp( trace.HitPos:Distance( EyePos() ) * 1.5 - 16, 0, 255 )
            alpha_saved = Lerp( .02, alpha_saved, alpha )
            alpha2 = 255 - alpha_saved
        end
        alpha2 = math.min( alpha2, GetConVarNumber( "pp_vignette_maxalpha" ) )
    
        local alpha3 = 0
        alpha3 = math.min( alpha3, GetConVarNumber( "pp_vignette_maxalpha" ) )
    
        local a = math.max( alpha, alpha1, alpha2, alpha3 )
    
        surface.SetDrawColor( 255, 0, 0, a )
        render.SetMaterial( m )

        for i = 1, GetConVarNumber( "pp_vignette_passes" ) do render.DrawScreenQuad() end
    end

    function PLUGIN:HUDShouldDraw()
        if GetConVar('nut_hidehud'):GetBool() then
            return false
        end
    end

    net.Receive('nutPostProcess', function()
        vgui.Create('nutSettings')
    end)

    net.Receive('nutUpdatePostProcessPush', function()
        local tbl = net.ReadTable()
        for k, v in pairs(tbl) do
            RunConsoleCommand(k, v)
        end
    end)
end

if SERVER then
    resource.AddWorkshop('104605841')
    util.AddNetworkString('nutPostProcess')
    
    util.AddNetworkString('nutUpdatePostProcessPush')
    util.AddNetworkString('nutUpdatePostProcessReceive')
    net.Receive('nutUpdatePostProcessReceive', function(_, client)
        if not client:IsSuperAdmin() then return end
        local tbl = net.ReadTable()
		PrintTable(tbl)
        net.Start('nutUpdatePostProcessPush')
            net.WriteTable(tbl)
        net.Broadcast()
    end)
end

nut.command.add("openppmenu",{
	superAdminOnly = true,
	onRun = function(client,args)
		net.Start('nutPostProcess', true)
		net.Send(client)
	end,
})