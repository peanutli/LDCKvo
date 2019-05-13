import Cocoa

//method -> class struct enum   实例方法 （-方法）    类型方法（类方法）(+方法)

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
print(counter.count)

counter.increment(by: 5)
print(counter.count)

counter.reset()
print(counter.count)


//构造器
struct Fahrenheit {
    var temperature : Double
    init() {
       temperature = 72.0
    }
}

let f = Fahrenheit()
print("======")
print(f.temperature)


//Celsius temperatureInCelsius   fromFahrenheit  fromKelvin
struct Celsius  {
    var temperatureInCelsius : Double
    init(fromFahrenheit fahrenheit : Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin : Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius:Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

print(boilingPointOfWater.temperatureInCelsius)
print(freezingPointOfWater.temperatureInCelsius)

//形参命名和实参标签   let red, green, blue: Double  let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)   let halfGray = Color(white: 0.5)
struct Color {
    let red, green,blue:Double
    init(red: Double, green: Double,blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white :Double) {
        red = white
        blue = white
        green = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 0.0)
let halfGray = Color(white: 0.5)

//不带实参标签的构造器形参
let bodyTemperature = Celsius(37.0)
print(bodyTemperature.temperatureInCelsius)
print("=================")

// SurveyQuestion  text response init ask print
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text;
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "abc"
let respons = cheeseQuestion.response!
print(respons)

//类的继承和构造过程
//类里面的所有存储型属性  包括所有继承自父类的属性  都必须在构造过程中设置初始值   指定构造器  便利构造器

class Vehicle {
    var numberOfWheels = 4
    var description :String {
        return "\(numberOfWheels) wheel(s)"

    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")


class Bicycle : Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Vehicle: \(bicycle.description)")


class Hoverboard : Bicycle {
    var color:String
    init(color:String){
        self.color  = color
    }
    override var description: String{
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

//构造器的 自动继承

//指定构造器和便利构造器实践
//Food、RecipeIngredient 以及 ShoppingListItem
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init (){
    self.init(name:"[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print(namedMeat.name);

let mysteryMeat = Food()
print(mysteryMeat.name)


//RecipeIngredient
class RecipeIngredient: Food {
    var quantity : Int
    init(name: String,quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

//扩展
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")



//扩展
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point,size: Size) {
        let orginX = center.x - size.width / 2
        let orginY = center.y - size.height / 2
        self.init(origin: Point(x: orginX, y: orginY), size: size)
    }
}

let rect  = Rect(center: Point(x: 10, y: 10), size: Size(width: 10, height: 10))
print("==================")
print(rect)


//扩展可以给现有类型添加新的  实例方法 和 类方法。在下面的例子中，给 Int 类型添加了一个新的实例方法叫做 repetitions：
extension Int {
    func repetionions(task:()->Void) {
        for _ in 0 ..< self {
            task()
        }
    }
}

3.repetionions {
    print("hello-")
}

4.repetionions {
    print("world!")
}

//可变实例方法

extension Int {
    mutating func square()  {
       self = self * self
    }
}

var m = 3
m.square()
print(m)


//下标  123456789[0] 返回 9  123456789[1] 返回 8

//协议
protocol SomeProtocol {
    var mustBeSettable: Int { set get }       //可读可写
    var doesNotNeedToBeSettable: Int { get }  //可读
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullNamed {
    var fullName: String { get }
}

struct Person : FullNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)


//FullyNamed Starship  prefix name init fullName
class Starship: FullNamed {
    var prefix: String?
    var name: String
    init(name:String,prefix:String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.name)
print(ncc1701.prefix!)
