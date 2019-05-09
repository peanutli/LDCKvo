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
    print("efg")
    a("真的太绕了，为什么这么说呢，因为这个值是在block里面打印出来的")
}


sumC { (a) in
    print(a)
}

/**-----------------------**/
typealias block1 = (String)->Void
func sumD(a:block1) {
    print("sumD")
    a("怎么的呢")
}

sumD { (a) in
    print(a)
}

/**-----------------------**/

/**-----------------------**/

/**-----------------------**/
/**-----------------------**/
/**-----------------------**/
/**-----------------------**/
/**-----------------------**/









