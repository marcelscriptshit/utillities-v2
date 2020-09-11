local modulename = "const-lib"
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

if (script or funcs or main) == nil then
    return
end

function module_table:findConst(func,typ,const)
    for i,v in next, getconsts(func) do
       if type(v) == typ and v == const then
          return v
       end
    end
end
function module_table:matchConsts(func,tabll)
    local found = {}
    for i,v in pairs(tabll) do
       found[v[2]] = module_table:findConst(func,v[1],v[2])
    end
    for i,v in pairs(tabll) do
       if found[v[2]] == nil then
          return false
       end
    end
    return true
end
function module_table:warnConsts(func,descend)
    for i,v in next, getconsts(func) do
        warn(i,v,type(v))
        if type(v) == "function" and descend then
            module_table:warnConsts(func,descend)
        end
    end
end






table.insert(loaded_modules,modulename)

return module_table


