local screen = UI.ScreenSize()
local center = {x = screen.width / 2, y = screen.height / 2}

shadow = Shadow.Text.Create()
shadow:Set({
	x = 200
	, y = 200
	, width = 100
	, height = 20
	
	, r = 255
	, g = 120
	, b = 0
	, a = 255
	, shadow = 2
		
	, text = "test Text"
	, font = "small"
	, align = "center"
})


shadow:Hide()
shadow:Show()
print(shadow:Get().shadow)
print(shadow:IsVisible())


tooltip = Tooltip.Text.Create()
tooltip:Set({
	x = 0
	, y = center.y + 50
	, width = screen.width
	
	, r = 255
	, g = 255
	, b = 0
	, a = 255
		
	, text = "This is also test Text"
	, font = "large"
	, align = "center"
})


tooltip:Hide()
tooltip:Show()
print(tooltip:Get().width)
print(tooltip:IsVisible())


circle = Circle.Box.Create()
circle:Set({
	x = 0
	, y = 0
	, quality = 200
	, radius = 200
	, scale = 1
	, r = 0
	, g = 255
	, b = 0
	, a = 255
})


circle:Hide()
circle:Show()
print(circle:Get().quality)
print(circle:IsVisible())


trapezoid = Trapezoid.Box.Create()
trapezoid:Set({
	x = 300
	, y = 300
	, isLeft = true
	, interval = 1
	, widthUp = 60
	, widthDown = 40
	, height = 50
	, pixel = 1
	, r = 255
	, g = 0
	, b = 0
	, a = 255
})


trapezoid:Hide()
trapezoid:Show()
print(trapezoid:Get().isLeft)
print(trapezoid:IsVisible())


rectangle = Rectangle.Box.Create()
rectangle:Set({
	x = 100
	, y = 200
	, width = 100
	, height = 100
	, size = 1
	, r = 0
	, g = 0
	, b = 0
	, a = 255
})


rectangle:Hide()
rectangle:Show()
print(rectangle:Get().size)
print(rectangle:IsVisible())

