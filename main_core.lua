AddEventHandler("onResourceStart",function (r)
    if r == GetCurrentResourceName() then
        if GetCurrentResourceName() ~= "NXS_CORE" then 
            print("[ NXS CORE ] DO NOT RENAME THE CORE RESOURCE! THIS WILL CAUSE ISSUES!")
        end 
    end
end)