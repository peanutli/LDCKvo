import Cocoa

//扩展现有类型的指定类型
protocol Container {
    associatedtype Item:Equatable
    mutating func append(_ item:Item)
    var count:Int { get }
    subscript(i:Int)->Item {get}
}
//
//extension Array : Container { }


//在关联类型约束里，使用协议

protocol SuffixableContainer: Container {
    associatedtype Suffix : SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}


