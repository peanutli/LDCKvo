import Cocoa

//枚举

enum CompassPoint {
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
