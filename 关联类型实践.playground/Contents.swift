import Cocoa

/*
 *关联类型的实践
 *
 *
 *
 */

protocol Container {
    associatedtype Item
    mutating func append(_ item:Item)
    var count : Int {get}
    subscript(i : Int) -> Item{ get }   //下标语法
}


//非泛型版本
struct IntStack : Container {
    var items = [Int]()
    mutating func push(_ item:Int) {
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
    
    //Container协议实现的部分
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i:Int) -> Int {
        return items[i]
    }
}


struct Stack<Element> :Container {
    var items = [Element]()
    mutating func push(_ item:Element) {
        items.append(item)
    }
    mutating func pop()-> Element {
        return items.removeLast()
    }
    
    //Container 协议部分
    typealias Item = Element
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i:Int) -> Element {
        return items[i]
    }
}
