local modulename = "loops-lib"
local module_table = {}
getgenv().script.main.module_storage[modulename] = {}


local rs = game:GetService("RunService")
local plrs = game:GetService("Players")
local l = game:GetService("Lighting")
local http = game:GetService("HttpService")
local UIS = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local cg = game:GetService("CoreGui")
local P = game:GetService("PathfindingService")
local SG = game:GetService("StarterGui")
local teams = game:GetService("Teams")
local lp = plrs.LocalPlayer
local mchar = lp.Character

local getconsts = debug.getconstants
local setconst = debug.setconstant
local getconst = debug.getconstant
local getupval = debug.getupvalue or getupvalue
local getupvals = debug.getupvalues or getupvalues
local getreg = debug.getregistry or getregistry or getreg
local setupval = debug.setupvalue or setupvalue
local mt = getrawmetatable(game)
local setreadonly = make_writeable or setreadonly
local copy = setclipboard or clipboard.set or copystring

local script = getgenv().script
local funcs = script.funcs
local main = script.main
local module_storage = getgenv().script.main.module_storage[modulename]
local loaded_modules = getgenv().script.main.module_storage.loaded
local loops = {}

if (script or funcs or main) == nil then
    return
end

function module_table:CreateLoop(name, func, wait_time, destroyed, ...)
    if loops[name] ~= nil then
       return
    end
    loops[name] = {}
    loops[name].Running = false
    loops[name].Destroy = false
    loops[name].CanBeDestroyed = destroyed
    loops[name].Loop = coroutine.create(function(...)
      while true do
        if loops[name].Running then
           func(...)
        end
        if loops[name].Destroy then
           break
        end
            if type(wait) == "userdata" then
                wait_time:wait()
            else
                wait(wait_time)
            end
        end
    end)
end
  
  
function module_table:RunLoop(name, func, wait_time, destroyed, ...)
    if loops[name] == nil then
       if func ~= nil then
          module_table:CreateLoop(name, func, wait_time, destroyed, ...)
       end
    end
    loops[name].Running = true
    local Succes,Failed = coroutine.resume(loops[name].Loop)
    if not Succes then
       warn("Loop: " .. tostring(name) .. " ERROR: " .. tostring(Failed))
    end
end
  
  
function module_table:StopLoop(name)
    if loops[name] == nil then
       return
    end
    loops[name].Running = false
end
  
  
function module_table:BreakLoop(name)
    if loops[name] == nil then
       return
    end
    module_table:StopLoop(name)
    loops[name].Destroy = true
    loops[name] = nil
end
  
  
function module_table:BreakAllLoops()
    for i,v in next, loops do
        module_table:BreakLoop(v)
    end
end




module_storage.loops = loops

table.insert(loaded_modules,modulename)

return module_table


