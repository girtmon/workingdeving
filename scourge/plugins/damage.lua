local PLUGIN = PLUGIN
PLUGIN.name = "Damage Effects"
PLUGIN.author = "Pokernut & Luna"
PLUGIN.desc = "Adds effects for getting hurt."

function PLUGIN:EntityTakeDamage(entity, dmgInfo)
    if entity:IsPlayer() then	
       entity:ScreenFade( 1, Color(0, 0, 0, 210), 0.3 * dmgInfo:GetDamage(), 0.2 * dmgInfo:GetDamage())
       entity:ViewPunch( Angle(2 * dmgInfo:GetDamage(), 9 * dmgInfo:GetDamage(), 1 * dmgInfo:GetDamage()) )
	end
end


  