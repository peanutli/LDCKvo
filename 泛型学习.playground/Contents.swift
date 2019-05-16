import Cocoa


//函数做泛型
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 100
swapTwoValues(&a, &b)

print("================")
print(a,b)

//模拟用泛型实现的栈
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop()->Element {
        return items.removeLast()
    }
}

var stackString = Stack<String>()
stackString.push("1")
stackString.push("2")
stackString.push("3")
stackString.push("4")
stackString.push("5")

print(stackString)


var stackInt = Stack<Int>()
stackInt.push(1)
stackInt.push(2)
stackInt.push(3)
stackInt.push(4)
stackInt.push(5)

print(stackInt.pop())
print(stackInt)


//泛型扩展
extension Stack {
    var topItem : Element? {
        return  items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackInt.topItem {
    print("The top item on the stack is \(topItem).")
}


//类型约束

/**
 *类型约束语法
 */

class SomeClass {
    
}

protocol SomeProtocol {
    
}

func someFunction<T: SomeClass,U: SomeProtocol>(SomeT:T,SomeU:U) {
    //这里是泛型函数体的部分
}

//非泛型函数

func findIndex(ofString valueToFind:String,in array:[String]) -> Int? {
    for (index,value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let array = ["1","2","3","4","5"]

if let foundIndex = findIndex(ofString "1",in array) {
    print("The index of llama is \(foundIndex)")

}




