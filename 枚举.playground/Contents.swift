import Cocoa

//枚举

enum CompassPoint :CaseIterable {
    case north
    case sourth
    case west
    case east
}

var direction : CompassPoint = .north

direction = .east
direction = .west

switch direction {
case .north:
    print("北方")
case .east:
    print("东方")
case .west:
    print("西方")
case .sourth:
    print("南方")
}

//枚举成员遍历  需要遵循CaseIterable 协议

let compassPoinCount = CompassPoint.allCases.count
print(compassPoinCount)

for point in CompassPoint.allCases {
    print(point)
}


//关联值
enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}
var productCode = Barcode.upc(100, 200, 200, 400)
productCode = .qrCode("dafdadsaf")

switch productCode {
case .upc:
    print("upc:\(productCode)")
case .qrCode:
     print("qrCode:\(productCode)" )
}

//原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//原始值的隐式赋值

enum Planet : Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planetValue  = Planet.venus.rawValue

print("venus:\(planetValue)")

//使用原始值初始化枚举值   未看懂

//递归枚举


