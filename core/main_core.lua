AddEventHandler("onResourceStart",function (r)
    if r == GetCurrentResourceName() then
        if GetCurrentResourceName() ~= "NXS_CORE" then 
            print("[ NXS CORE ] DO NOT RENAME THE CORE RESOURCE! THIS WILL CAUSE ISSUES!")
        end
    end

    Wait(3000)

    print([[
            ███╗   ██╗██╗  ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗
            ████╗  ██║╚██╗██╔╝██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
            ██╔██╗ ██║ ╚███╔╝ ███████╗    ██║     ██║   ██║██████╔╝█████╗  
            ██║╚██╗██║ ██╔██╗ ╚════██║    ██║     ██║   ██║██╔══██╗██╔══╝  
            ██║ ╚████║██╔╝ ██╗███████║    ╚██████╗╚██████╔╝██║  ██║███████╗
            ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
                            Nexus Core has started!
                        Core object reference, has been
                                  sucessfull
                                                               
                        Please, configure your Core, it will not be 
                    the same for all servers.



    ]])
end)

