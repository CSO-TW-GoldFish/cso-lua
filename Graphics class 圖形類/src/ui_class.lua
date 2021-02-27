------------------------------------
--[[ functions ]]
------------------------------------

-- code from Rollermine
local function setArgs(data, args)
    for k in pairs(data) do
        if type(data[k]) == type(args[k]) then
            if type(data[k]) == "table" then
                setArgs(data[k], args[k])
            else
                data[k] = args[k]
            end
        end
    end
end

-- code from Rollermine
local function deepCall(table, funcName, args)
    for _,v in pairs(table) do
        if type(v) == "table" then
            deepCall(v, funcName)
        elseif type(v) == "userdata" then
            v[funcName](v, args)
        end
    end
end

-- code from Rollermine
local function clone(table)
    local temp = {}
    for k,v in pairs(table) do
        if type(v) == "table" then
            temp[k] = clone(v)
        else
            temp[k] = v
        end
    end
    return temp
end


------------------------------------
--[[ Module Class ]]
------------------------------------


Module = {}
Module.__index = Module


function Module:Set(args)
	if type(args) == "table" then
		setArgs(self.SetArg, args)
	end
	self:Update()
end


function Module:Get()
	return clone(self.SetArg)
end
	
	
function Module:Show()
	deepCall(self.UI, "Show")
	self.visible = true
end


function Module:Hide()
	deepCall(self.UI, "Hide")
	self.visible = false
end


function Module:IsVisible()
	return self.visible
end


------------------------------------
--[[ Shadow Class ]]
------------------------------------


Shadow = {}


--[[ Shadow.Text Class ]]
Shadow.Text = setmetatable({}, Module)
Shadow.Text.__index = Shadow.Text


function Shadow.Text.Create()
	local obj = {
		SetArg = {
			x = 0
			, y = 0
			, width = 0
			, height = 0
			
			, r = 255
			, g = 255
			, b = 255
			, a = 255
			, shadow = 2
				
			, text = ""
			, font = "small"
			, align = "left"
		}
		, UI = {
			back = UI.Text.Create()
			, front = UI.Text.Create()
		}
		, visible = true
	}
	return setmetatable(obj, Shadow.Text)
end

	
function Shadow.Text:Update()
	local arg = self.SetArg
	local offset = {
		back    = {x = arg.shadow, y = arg.shadow, r =     0, g =     0, b =     0, a = arg.a}
		, front = {x =          0, y =          0, r = arg.r, g = arg.g, b = arg.b, a = arg.a}
	}
	for k,v in pairs(self.UI) do
		local temp = {
			x = arg.x + offset[k].x
			, y = arg.y + offset[k].y
			, width = arg.width
			, height = arg.height
			
			, r = offset[k].r
			, g = offset[k].g
			, b = offset[k].b
			, a = offset[k].a
				
			, text = arg.text
			, font = arg.font
			, align = arg.align
		}
		v:Set(temp)
	end
end


------------------------------------
--[[ Tooltip Class ]]
------------------------------------


Tooltip = {}


Tooltip.FONT = {
	small       = {height =  20, shadowSet = 2}
	, medium    = {height =  45, shadowSet = 3}
	, large     = {height =  60, shadowSet = 4}
	, verylarge = {height = 100, shadowSet = 5}
}


--[[ Tooltip.Text Class ]]
Tooltip.Text = setmetatable({}, Module)
Tooltip.Text.__index = Tooltip.Text


function Tooltip.Text.Create()
	local obj = {
		SetArg = {
			x = 0
			, y = 0
			, width = 0
			
			, r = 255
			, g = 255
			, b = 255
			, a = 255
				
			, text = ""
			, font = "small"
			, align = "left"
		}
		, UI = {
			background = UI.Box.Create()
			, border_up = UI.Box.Create()
			, border_down = UI.Box.Create()
			, text = Shadow.Text.Create()
		}
		, visible = true
	}
	return setmetatable(obj, Tooltip.Text)
end

	
function Tooltip.Text:Update()
	local arg = self.SetArg
	local height = Tooltip.FONT[ arg.font ].height
	local shadow = Tooltip.FONT[ arg.font ].shadowSet
	local offset = {
		background    = {r =     0, g =     0, b =     0, a =   120, y =      0, height = height}
		, border_up   = {r = arg.r, g = arg.g, b = arg.b, a = arg.a, y =      0, height = 1}
		, border_down = {r = arg.r, g = arg.g, b = arg.b, a = arg.a, y = height, height = 1}
		, text        = {r = arg.r, g = arg.g, b = arg.b, a = arg.a, y =     12, height = height}
	}
	for k,v in pairs(self.UI) do
		local temp = {
			x = arg.x
			, y = arg.y + offset[k].y
			, width = arg.width
			, height = offset[k].height
			
			, r = offset[k].r
			, g = offset[k].g
			, b = offset[k].b
			, a = offset[k].a
			, shadow = shadow
				
			, text = arg.text
			, font = arg.font
			, align = arg.align
		}
		v:Set(temp)
	end
end


------------------------------------
--[[ Circle Class 圓形 ]]
------------------------------------


Circle = {}

Circle.Box = setmetatable({}, Module)
Circle.Box.__index = Circle.Box


function Circle.Box.Create()
	local obj = {
		SetArg = {
			x = 0
			, y = 0
			, quality = 0
			, radius = 0
			, scale = 1
			, r = 0
			, g = 0
			, b = 0
			, a = 255
		}
		, UI = {}
		, visible = false
	}
	return setmetatable(obj, Circle.Box)
end


-- code from misk
function Circle.Box:Update()
	local arg = self.SetArg
	local quality = arg.quality
	for i = 1, quality * 2 do
		local temp = {
			x = math.floor((arg.x + arg.radius * i / quality) / arg.scale)
			, y = math.floor((arg.y + arg.radius - math.sqrt(math.abs(arg.radius ^ 2 - (arg.radius * (quality - i) / quality) ^ 2))) * arg.scale)
			, width = math.floor((arg.radius / quality) / arg.scale) + 1
			, height = math.floor(math.sqrt(math.abs(arg.radius ^ 2 - (arg.radius * (quality - i) / quality) ^ 2)) * arg.scale * 2)
			, r = arg.r
			, g = arg.g
			, b = arg.b
			, a = arg.a
		}
		if not self.UI[i] then self.UI[i] = UI.Box.Create() end
		self.UI[i]:Set(temp)
	end
end


------------------------------------
--[[ Trapezoid Class 梯形 ]]
------------------------------------


Trapezoid = {}

Trapezoid.Box = setmetatable({}, Module)
Trapezoid.Box.__index = Trapezoid.Box


function Trapezoid.Box.Create()
	local obj = {
		SetArg = {
			x = 0
			, y = 0
			, isLeft = false
			, interval = 0
			, widthUp = 0
			, widthDown = 0
			, height = 0
			, pixel = 0
			, r = 0
			, g = 0
			, b = 0
			, a = 255
		}
		, UI = {}
		, visible = false
	}
	return setmetatable(obj, Trapezoid.Box)
end


-- code from misk ruby2009g
function Trapezoid.Box:Update()
	local arg = self.SetArg
	local isLeft = arg.isLeft and 1 or 0
	for i = 1, arg.height do
		local temp = {
			x = arg.x - math.ceil((arg.widthUp - (i / arg.height * (arg.widthUp - arg.widthDown))) * isLeft)
			, y = arg.y + i
			, width = math.ceil(arg.widthUp - (i / arg.height * (arg.widthUp - arg.widthDown)))
			, height = arg.pixel
			, r = arg.r
			, g = arg.g
			, b = arg.b
			, a = arg.a
		}
		if not self.UI[i] then self.UI[i] = UI.Box.Create() end
		self.UI[i]:Set(temp)
	end
end


------------------------------------
--[[ Rectangle Class 矩形 ]]
------------------------------------


Rectangle = {}

Rectangle.Box = setmetatable({}, Module)
Rectangle.Box.__index = Rectangle.Box


function Rectangle.Box.Create()
	local obj = {
		SetArg = {
			x = 0
			, y = 0
			, width = 0
			, height = 0
			, size = 1
			, r = 255
			, g = 255
			, b = 255
			, a = 255
		}
		, UI = {}
		, visible = false
	}
	return setmetatable(obj, Rectangle.Box)
end


-- code from AnggaraNothing
function Rectangle.Box:Update()
	local arg = self.SetArg
	for i = 1, 4 do
		local temp = {
			r = arg.r
			, g = arg.g
			, b = arg.b
			, a = arg.a
		}
		
		if i == 1 then -- up
			temp.x = arg.x - arg.size
			temp.y = arg.y - arg.size
			temp.width = arg.width + ( arg.size * 2 )
			temp.height = arg.size

		elseif i == 2 then -- down
			temp.x = arg.x - arg.size
			temp.y = arg.y + arg.height
			temp.width = arg.width + ( arg.size * 2 )
			temp.height = arg.size

		elseif i == 3 then -- left
			temp.x = arg.x - arg.size
			temp.y = arg.y - arg.size
			temp.width = arg.size
			temp.height = arg.width + ( arg.size * 2 )

		elseif i == 4 then -- right
			temp.x = arg.x + arg.width
			temp.y = arg.y - arg.size
			temp.width = arg.size
			temp.height = arg.height + ( arg.size * 2 )

		end
		if not self.UI[i] then self.UI[i] = UI.Box.Create() end
		self.UI[i]:Set(temp)
	end
end
