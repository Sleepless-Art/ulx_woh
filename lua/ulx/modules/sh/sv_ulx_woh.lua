-- Custom ULX woH message
-- Created by Sleepless Art 3/25/2018

AddCSLuaFile( "lua/..../cl/cl_materials.lua" )

local CATEGORY_NAME = "Fun"

function ulx.woh( calling_ply, target_plys, should_unwoh )
    for i=1, #target_plys do
        target_plys[i]:SetNWBool( "ulx_woh", not should_unwoh )
    end

    if not should_unwoh then
        ulx.fancyLogAdmin( calling_ply, "#A woh #T", target_plys )
    else
        ulx.fancyLogAdmin( calling_ply, "#A unwoh #T", target_plys )
    end
end
local woh = ulx.command( CATEGORY_NAME, "ulx woh", ulx.woh, "!woh" )
woh:addParam{ type=ULib.cmds.PlayersArg }
woh:addParam{ type=ULib.cmds.BoolArg, invisible=true }
woh:defaultAccess( ULib.ACCESS_ADMIN )
woh:help( "woh target(s) so they are unable to chat normally." )
woh:setOpposite( "ulx unwoh", {_, _, true}, "!unwoh" )
