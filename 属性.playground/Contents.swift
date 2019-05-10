import Cocoa

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
 //rangeOfThreeItems.length = 10  此处不能赋值的原因是，因为是常量存储属性，后期不能改变


//rangeOfThreeItems

//常量结构体实例的存储属性
let  rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

//延时加载存储属性  相当于oc里面得了懒加载了 lazy关键字   只有第一次被调用的时候，才会去初始化属性值 用lazy关键字

class DataImporter {
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter ()
    var data = [String]()
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("Some more data")


//只读计算属性    只有getter 和没有 setter 方法 的属性，叫只读计算属性
struct Point {
    var x = 0.0 , y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

//setter 方法有参数   getter 方法 return返回值  setter 方法  入参
struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
           let centerX = origin.x + (size.width / 2)
           let centerY = origin.y + (size.height / 2)
           return Point(x: centerX, y: centerY)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)  //这个是简化版的setter 方法 不写入参，参数可以使用newValue
        }
    }
}

var squar = Rect(origin: Point(x: 0.0, y: 0.0), size:Size(width: 10.0, height: 10.0) )
print("square.origin is now at (\(squar.center.x), \(squar.center.y))")    //计算属性，这么多年之后，今天用swift写，仍然感觉很惊艳
let initialSquareCenter = squar.center
squar.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(squar.origin.x), \(squar.origin.y))")
//属性观察器
/**
 *{}
 */
/*
 *
 *
 **/

