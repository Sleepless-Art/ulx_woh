local wohMaterial = Material("woh.png", "noclamp smooth")
local wohWidth, wohHeight = 64, 64
local wohOffset = 90

hook.Add("PostPlayerDraw", "PaintWoh", function()
    cam.Start3D()
        render.SetMaterial(wohMaterial)
        for _,ply in pairs(player.GetHumans()) do
            if ply:GetNWBool("ulx_woh") then
                local plyPos = ply:GetPos()
                local wohPos = Vector(plyPos.x, plyPos.y, plyPos.z + wohOffset)
                render.DrawSprite(wohPos, wohWidth, wohHeight, white)
            end
        end
    cam.End3D()
end)
