import Cocoa

var str = "这是一个测试数据😊😊"
//let count1 = str.lengthOfBytes(using: String.Encoding.utf8) //每个汉字占3个字节

for i in str.characters {
    print(i)
}

