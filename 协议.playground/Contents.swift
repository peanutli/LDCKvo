import Cocoa
//方法要求

protocol SomeProtocol {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")


print("And another one: \(generator.random())")

//SomeProtocol  SomeSuperClass  SomeSubClass
//protocol  SomeProtocol1 {
//    init()
//}
//
//class SomeSuperClass {
//    init() {
//
//    }
//}
//
//class SomeSubClass: SomeSuperClass,SomeProtocol1{
//    required override init() {
//
//    }
//}







