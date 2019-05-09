import Cocoa
//定义结构体
struct Resolution {
    //在这里定义结构体
    var width = 0
    var height = 0
    var name = 0
}

//定义类
class VideoMode {
    //在这里定义类
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let videoMode = VideoMode()

let someVideoMode = VideoMode()
let someResolution = Resolution()

someVideoMode.resolution.width = 10
someVideoMode.resolution.height = 100

let vga = Resolution(width: 100, height: 1000, name: 1000)

//结构体和枚举是值类型
let hd = Resolution(width: 100, height: 100, name: 100)
var cinema = hd
cinema.width = 200


/****
 *struct 是值类型的，所以进行赋值的时候，都是值拷贝，
 *所以hd.width 和 cinema.width 的值
 *是 不会互相影响的
 *枚举也遵循相同的规则
 ****/
print(hd.width)
print(cinema.width)

/**
 *枚举也遵循相同的规则
 *
 **/

//类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("==========")
/**
 *引用类型，一个改变，另一个也改变
 **/
print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

//恒等运算符  ===  !==   这个跟oc == 和 != 差不多

