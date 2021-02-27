## Class Module

延伸 UI.Box 和 UI.Text 的類

| Methods (方法)     | 說明                      |
| ------------------ | ------------------------- |
| Module:Set()       | 變更屬性設定              |
| Module:Get()       | 獲取此 class 的屬性 table |
| Module:Show()      | 在畫面上顯示              |
| Module:Hide()      | 隱藏畫面顯示              |
| Module:IsVisible() | 告知目前畫面上標示與否    |

## Class Shadow.Text

此 Class 會繼承 Module Class 所以 Create 之後，可以使用 Module Class 的 Methods 。

| Tables(表)         | 說明               |
| ------------------ | ------------------ |
| Shadow.Text.SetArg | 設定屬性的資料類型 |

| Methods (方法)       | 說明                                                       |
| -------------------- | ---------------------------------------------------------- |
| Shadow.Text.Create() | 每次創建，會使用 2 個UI.Text                               |
| Shadow.Text:Update() | 更新屬性設定 (使用Set()時，該方法會自動使用，不須額外調用) |

**Shadow.Text.SetArg**

​	設定屬性的資料類型

​	**Fields:**

- text：(optional string) 畫線顯示的文字
- font：(optional string) 字體大小 *(small, medium, large, verylarge)*
- align：(optional string) 排列 *(left, center, right)*
- x：(optional int) x 座標
- y：(optional int) y 座標
- width：(optional int) 寬度
- height：(optional int) 高度
- r：(optional int) 文字顏色(紅色). 0~255 範圍
- g：(optional int) 文字顏色(綠色). 0~255 範圍
- b：(optional int) 文字顏色(藍色). 0~255 範圍
- a：(optional int) 文字顏色(透明度). 0~255 範圍
- shadow：(optional int) 文字陰影程度(預設 2)

## Class Tooltip.Text

此 Class 會繼承 `Module` Class 所以 Create 之後，可以使用 `Module` Class 的 Methods 。

| Tables(表)          | 說明               |
| ------------------- | ------------------ |
| Tooltip.Text.SetArg | 設定屬性的資料類型 |

| Fields(屬性)                                           |
| ------------------------------------------------------ |
| Tooltip.FONT.small = {height =  20, shadowSet = 2}     |
| Tooltip.FONT.medium = {height =  45, shadowSet = 3}    |
| Tooltip.FONT.large = {height =  60, shadowSet = 4}     |
| Tooltip.FONT.verylarge= {height =  100, shadowSet = 5} |

| Methods (方法)        | 說明                                                       |
| --------------------- | ---------------------------------------------------------- |
| Tooltip.Text.Create() | 每次創建，會使用 3 個UI.Box 和 1個UI.Text                  |
| Tooltip.Text:Update() | 更新屬性設定 (使用Set()時，該方法會自動使用，不須額外調用) |

**Tooltip.Text.SetArg**

​	設定屬性的資料類型

​	**Fields:**

- text：(optional string) 畫線顯示的文字
- font：(optional string) 字體大小 *(small, medium, large, verylarge)*
- align：(optional string) 排列 *(left, center, right)*
- x：(optional int) x 座標
- y：(optional int) y 座標
- width：(optional int) 寬度
- r：(optional int) 文字顏色(紅色). 0~255 範圍
- g：(optional int) 文字顏色(綠色). 0~255 範圍
- b：(optional int) 文字顏色(藍色). 0~255 範圍
- a：(optional int) 文字顏色(透明度). 0~255 範圍

## Class Circle.Box

此 Class 會繼承 `Module` Class 所以 Create 之後，可以使用 `Module` Class 的 Methods 。

| Tables(表)        | 說明               |
| ----------------- | ------------------ |
| Circle.Box.SetArg | 設定屬性的資料類型 |

| Methods (方法)      | 說明                                                       |
| ------------------- | ---------------------------------------------------------- |
| Circle.Box.Create() | 創建數量為 `quality` 屬性多寡 * 2                          |
| Circle.Box:Update() | 更新屬性設定 (使用Set()時，該方法會自動使用，不須額外調用) |

**Circle.Box.SetArg**

​	設定屬性的資料類型

​	**Fields:**

- x：(optional int) x 座標
- y：(optional int) y 座標
- quality：(optional int) 畫質
- radius：(optional int) 半徑
- scale：(optional int) 壓縮量
- r：(optional int) 文字顏色(紅色). 0~255 範圍
- g：(optional int) 文字顏色(綠色). 0~255 範圍
- b：(optional int) 文字顏色(藍色). 0~255 範圍
- a：(optional int) 文字顏色(透明度). 0~255 範圍

## Class Trapezoid.Box

此 Class 會繼承 `Module` Class 所以 Create 之後，可以使用 `Module` Class 的 Methods 。

| Tables(表)           | 說明               |
| -------------------- | ------------------ |
| Trapezoid.Box.SetArg | 設定屬性的資料類型 |

| Methods (方法)         | 說明                                                       |
| ---------------------- | ---------------------------------------------------------- |
| Trapezoid.Box.Create() | 創建數量 根據 `height` 屬性                                |
| Trapezoid.Box:Update() | 更新屬性設定 (使用Set()時，該方法會自動使用，不須額外調用) |

**Trapezoid.Box.SetArg**

​	設定屬性的資料類型

​	**Fields:**

- x：(optional int) x 座標
- y：(optional int) y 座標
- isLeft：(optional bool) 是否左邊
- interval：(optional int) 間隔
- widthUp：(optional int) 上面寬度
- widthDown：(optional int) 下面寬度
- height：(optional int) 整體高度
- pixel：(optional int) 像素大小

- r：(optional int) 文字顏色(紅色). 0~255 範圍
- g：(optional int) 文字顏色(綠色). 0~255 範圍
- b：(optional int) 文字顏色(藍色). 0~255 範圍
- a：(optional int) 文字顏色(透明度). 0~255 範圍

## Class Rectangle.Box

此 Class 會繼承 `Module` Class 所以 Create 之後，可以使用 `Module` Class 的 Methods 。

| Tables(表)           | 說明               |
| -------------------- | ------------------ |
| Rectangle.Box.SetArg | 設定屬性的資料類型 |

| Methods (方法)         | 說明                                                       |
| ---------------------- | ---------------------------------------------------------- |
| Rectangle.Box.Create() | 每次創建，會使用 4 個UI.Box                                |
| Rectangle.Box:Update() | 更新屬性設定 (使用Set()時，該方法會自動使用，不須額外調用) |

**Rectangle.Box.SetArg**

​	設定屬性的資料類型

​	**Fields:**

- x：(optional int) x 座標
- y：(optional int) y 座標
- width：(optional int) 寬度
- height：(optional int) 高度
- size：(optional int) 粗度

- r：(optional int) 文字顏色(紅色). 0~255 範圍
- g：(optional int) 文字顏色(綠色). 0~255 範圍
- b：(optional int) 文字顏色(藍色). 0~255 範圍
- a：(optional int) 文字顏色(透明度). 0~255 範圍