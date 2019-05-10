import Cocoa

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6


//rangeOfThreeItems

//常量结构体实例的存储属性
let  rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

//延时加载存储属性  相当于oc里面得了懒加载了 lazy关键字

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

//属性观察器

/*
 *
 *
 **/

