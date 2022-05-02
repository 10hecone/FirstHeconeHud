if SERVER then
    resource.AddSingleFile("materials/billet.png")
    resource.AddSingleFile("materials/boss.png")
    resource.AddSingleFile("materials/piece.png")
    resource.AddSingleFile("materials/portefeuille.png")
    resource.AddSingleFile("materials/user.png")
    resource.AddSingleFile("materials/shield.png")
end

if CLIENT then


    local Material = Material
    local billet = Material("billet.png")
    local boss = Material("boss.png")
    local piece = Material("piece.png")
    local portefeuille = Material("portefeuille.png")
    local user = Material("user.png")
    local shild = Material("shield.png")
    
    
    hook.Add("HUDShouldDraw", "maskhud", function(Name)
        if (Name == "CHudHealth" or Name == "CHudBattery" or Name == "DarkRP_HUD") then
            return false
        end
    
    end)
    
    hook.Add("HUDPaint", "heconehud", function()

        local ply = LocalPlayer()
        local playerName = ply:Nick()
        local armor = ply:Armor() 
        local health = ply:Health() 
        local salary = ply:getDarkRPVar("salary")
        local money = ply:getDarkRPVar("money")
        local fonctionnalite = ply:getDarkRPVar("job")
        local rule = ply:GetUserGroup(" ")

        surface.CreateFont("HeconeFont", {
            font = "",
            size = ScreenScale( 10),
            weight = 7000,
        })

        draw.RoundedBox(10, ScrW()/64, ScrH()/1.107, ScrW()/6.19, ScrH()/13.5, Color(25, 25, 23, 200))          -- Fond
        
        if health >= 100 then

            draw.RoundedBox(10, ScrW()/61, ScrH()/1.1, ScrW()/6.25, ScrH()/36, Color(15, 15, 15, 210))          -- Bar de Vie
            draw.RoundedBox(10, ScrW()/56, ScrH()/1.096, ScrW()/6.37, ScrH()/43.2, Color(2, 225, 90, 200))

        else
    
            draw.RoundedBox(10, ScrW()/61, ScrH()/1.1, ScrW()/6.25, ScrH()/36, Color(15, 15, 15, 210))          -- Bar de Vie
            draw.RoundedBox(10, ScrW()/56, ScrH()/1.096, health*3, ScrH()/43.2, Color(2, 225, 90, 200))

        end

        if armor >= 100 then

            draw.RoundedBox(10, ScrW()/61, ScrH()/1.061, ScrW()/6.25, ScrH()/36, Color(15, 15, 15, 210))         -- Bar d'armure
            draw.RoundedBox(10, ScrW()/56, ScrH()/1.058, ScrW()/6.37, ScrH()/43.2, Color(2, 130, 150, 200))
     
        else

            draw.RoundedBox(10, ScrW()/61,  ScrH()/1.061, ScrW()/6.25, ScrH()/36, Color(15, 15, 15, 210))         -- Bar d'armure
            draw.RoundedBox(10, ScrW()/56, ScrH()/1.058, armor*3, ScrH()/43.2, Color(2, 130, 150, 200))

        end
        
        draw.RoundedBox(10, ScrW()/64,  ScrH()/1.31, ScrW()/6.19, ScrH()/7.2, Color(25, 25, 23, 200))          -- Fond

        draw.RoundedBox(10, ScrW()/48,  ScrH()/1.29, ScrW()/9.6, ScrH()/27, Color(15, 15, 15, 210))
        draw.SimpleText(playerName, "HeconeFont", ScrW()/23.8, ScrH()/1.28, Color(190, 190, 190))

        draw.RoundedBox(10, ScrW()/7.8, ScrH()/1.29, ScrW()/22.5, ScrH()/27, Color(15, 15, 15, 210))
        draw.SimpleText(salary, "HeconeFont", ScrW()/6.86, ScrH()/1.283, Color(190, 190, 190))
   
        draw.RoundedBox(10, ScrW()/48, ScrH()/1.227, ScrW()/9.6, ScrH()/27, Color(15, 15, 15, 210))
        draw.SimpleText(money, "HeconeFont", ScrW()/23.8, ScrH()/1.218, Color(190, 190, 190))

        draw.RoundedBox(10, ScrW()/48, ScrH()/1.1675, ScrW()/9.6, ScrH()/27, Color(15, 15, 15, 210))
        draw.SimpleText(fonctionnalite, "HeconeFont", ScrW()/23.8, ScrH()/1.16, Color(190, 190, 190))

        draw.RoundedBox(10, ScrW()/7.8, ScrH()/1.227, ScrW()/22.5, ScrH()/27, Color(15, 15, 15, 210))



        if (rule == "user") then

            surface.SetDrawColor(color_white)
            surface.SetMaterial(user)
            surface.DrawTexturedRect(ScrW()/7.1, ScrH()/1.22, ScrW()/64, ScrH()/36)
        
        else

            surface.SetDrawColor(color_white)
            surface.SetMaterial(shild)
            surface.DrawTexturedRect(ScrW()/7.1, ScrH()/1.22, ScrW()/64, ScrH()/36)

        end
        --draw.SimpleText(armor, "HeconeFont", 985, 1018, Color(2, 150, 225))

        surface.SetDrawColor(color_white)
        surface.SetMaterial(billet)
        surface.DrawTexturedRect(ScrW()/44, ScrH()/1.22, ScrW()/64, ScrH()/36)

        surface.SetMaterial(boss)
        surface.DrawTexturedRect(ScrW()/44, ScrH()/1.28, ScrW()/64, ScrH()/36)

        surface.SetMaterial(portefeuille)
        surface.DrawTexturedRect(ScrW()/44, ScrH()/1.16, ScrW()/64, ScrH()/36)

        surface.SetMaterial(piece)
        surface.DrawTexturedRect(ScrW()/7.70, ScrH()/1.29, ScrW()/64, ScrH()/36)


    end)

end
