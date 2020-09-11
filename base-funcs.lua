local modulename = "base-funcs"
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
local fakebackups = {}
local link_succes = {}


if script or funcs or main == nil then
    return
end


function module_table:getSize(p)
    if p:isA ("BasePart") then
       return p.Size
     end
     if p:IsA ("MeshPart") then
       return p.Size
    end
end

function module_table:findWS(name,class)
    for i,v in pairs(workspace:GetDescendants())do
        if v.Name == name and v:isA(class) then
            return v
        end
    end
end
  
function module_table:findPlayer(str)
    local plrs = {}
    for i,v in pairs(plrs:GetPlayers()) do
        if string.find(tostring(v),string.lower(str)) then
            table.insert(plrs,v)
        end
    end
    if #plrs == 1 then
      return "single",plrs[1]
    end
    if #plrs > 1 then
      return "multi",plrs
    end
    return false
end

function module_table:createBackup(name, f)
    fakebackups[name] = { }
    fakebackups[name].func = f
    return fakebackups[name].func
end
  
function module_table:isImported(name)
    if getgenv().script.main.module_storage.loaded == nil then
        return
    end
    if getgenv().script.main.module_storage.loaded[name] ~= nil then
        return true
    end
    return false
 end
  
function module_table:waitForImport(name)
    if getgenv().script.main.module_storage.loaded == nil then
       return
    end
    repeat
        wait()
    until self:isImported(name) == true
end
  
function module_table:import(branch,branch2,name)
    local link = "https://raw.githubusercontent.com/marcelscriptshit/"..branch.."/"..branch2.."/"..name..".lua"
    return loadstring(game:HttpGet(link, true))()
end



module_storage.link_succes = link_succes
module_storage.fakebackups = fakebackups

table.insert(loaded_modules,modulename)

return module_table


