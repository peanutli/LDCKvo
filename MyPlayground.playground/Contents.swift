import Cocoa

//let sum = { (a:Int,b:Int) -> Int in
//    return a + b
//}
//
//let s = sum(10,20);
//
///**
// 从上下文推倒参数和返回类型
// */
//let sum = { (a,b) -> Int in
//    return a + b
//}
//
//print(sum(25,15))

/**
 起别名
 */

typealias  block =  (Int,Int) -> Int

let sum :  block =  { (a,b) in
    return a + b
}

print(sum(15,15))

/**-----------------------**/
func sumA(a:Int,b:()-> Int) -> (Int) {
    return a + b();
}

print(sumA(a: 10, b: {
     10
    }))

/**-----------------------**/
func sumB (a:Int) ->(Int) {
    let b = a + 5
    return sum (10,b)
}
print(sumB(a: 100))

/**-----------------------**/
func sumC(a:(String)->Void) {
    let str = "真的太绕了，为什么这么说呢，因为这个值是在block里面打印出来的"
    print("efg")
    a(str)
}


sumC { (a) in
    print(a)
}

/**-----------------------**/
typealias block1 = (String)->Void
func sumD(a:block1) {
    print("sumD")
    let str = "怎么的呢"
    a(str)
}

sumD { (a) in
    print(a)
}

/**-----------------------**/
typealias block2 = (String) -> String
func sumE(a:block2) {
    let blockResult = a("XXXXX")
    print(blockResult)
}

sumE { (a) -> String in
    return a + "100"
}

/**-----------------------**/
typealias blcok3 = (String)->String
func sumF(a:blcok3) -> (String) {
    return"Hello-" + a("FFF")
}

print(sumF { (a) -> String in
    return a + "-100"
})


/**-----------------------**/
//逃逸闭包  很多启动异步操作的函数，接收一个闭包参数作为completionHandler 这个操作在异步操作结束之后立即返回，但是闭包在异步操作结束之后，才会调用。 这种情况下，闭包需要做成逃逸函数 @escaping

/**-----------------------**/

/**-----------------------**/
/**-----------------------**/
/**-----------------------**/









