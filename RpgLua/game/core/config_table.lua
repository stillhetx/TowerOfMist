Config={}

function Config.Config_table()

end


function Config.Pos_monster(str)
        Debug_temp=""
        for k,i in pairs(horda[str]) do
            for k,ii in pairs(i.enemyList) do
                i.enemyTeams[k]=copiar_tabla(enemy_list[ii]) 
                if #i.enemyList==1 then
                    i.enemyTeams[k].x=posiciones_enemigos_uno[k].x
                    i.enemyTeams[k].y=posiciones_enemigos_uno[k].y
                    i.enemyTeams[k].x_=posiciones_enemigos_uno[k].x
                    i.enemyTeams[k].y_=posiciones_enemigos_uno[1].y
                    i.enemyTeams[k].id=i.enemyTeams[1].id.."_1" 
                    i.enemyTeams[k].p=1
                elseif #i.enemyList==2 then    
                    i.enemyTeams[k].x=posiciones_enemigos_dos[k].x
                    i.enemyTeams[k].y=posiciones_enemigos_dos[k].y
                    i.enemyTeams[k].x_=posiciones_enemigos_dos[k].x
                    i.enemyTeams[k].y_=posiciones_enemigos_dos[k].y
                    i.enemyTeams[k].id=i.enemyTeams[1].id.."_"..k
                    i.enemyTeams[k].p=2
                elseif #i.enemyList==3 then    
                    i.enemyTeams[k].x=posiciones_enemigos[k].x
                    i.enemyTeams[k].y=posiciones_enemigos[k].y
                    i.enemyTeams[k].x_=posiciones_enemigos[k].x
                    i.enemyTeams[k].y_=posiciones_enemigos[k].y
                    i.enemyTeams[k].id=i.enemyTeams[1].id.."_"..k
                    i.enemyTeams[k].p=3
                end
                
            end
        end        
end


function Config.Pos_monster_Nvg()
        Debug_temp=""
        for t,i in pairs(enemyGroups) do
            if i.enemyList~=nil then
                for k,ii in pairs(i.enemyList) do
                    i.enemyTeams[k]=copiar_tabla(enemy_list[ii]) 
                    if #i.enemyList==1 then
                        i.enemyTeams[k].x=posiciones_enemigos_uno[k].x
                        i.enemyTeams[k].y=posiciones_enemigos_uno[k].y
                        i.enemyTeams[k].x_=posiciones_enemigos_uno[k].x
                        i.enemyTeams[k].y_=posiciones_enemigos_uno[1].y
                        i.enemyTeams[k].id=i.enemyTeams[k].id.."_"..k
                        i.enemyTeams[k].p=1
                    elseif #i.enemyList==2 then    
                        i.enemyTeams[k].x=posiciones_enemigos_dos[k].x
                        i.enemyTeams[k].y=posiciones_enemigos_dos[k].y
                        i.enemyTeams[k].x_=posiciones_enemigos_dos[k].x
                        i.enemyTeams[k].y_=posiciones_enemigos_dos[k].y
                        i.enemyTeams[k].id=i.enemyTeams[k].id.."_"..k
                        i.enemyTeams[k].p=2
                    elseif #i.enemyList==3 then    
                        i.enemyTeams[k].x=posiciones_enemigos[k].x
                        i.enemyTeams[k].y=posiciones_enemigos[k].y
                        i.enemyTeams[k].x_=posiciones_enemigos[k].x
                        i.enemyTeams[k].y_=posiciones_enemigos[k].y
                        i.enemyTeams[k].id=i.enemyTeams[k].id.."_"..k
                        i.enemyTeams[k].p=3
                    end
                    
                end
            end
        end        
end