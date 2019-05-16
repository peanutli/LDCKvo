import Cocoa

/**
 *使用泛型约束的好处是  方便对 某些情况的 result 进行扩展
 *栗子1 🌰  某些异步操作，可能永远没有错误返回 ， 我们会选择一种特定的类型，来代表这种情况  Timer
 */

enum noError: Error {
    
}

enum Result<T,E:Error> {
    case successful(T)
    case failure
}



func run(after:TimeInterval,done:@escaping (Result<Timer,noError>)->Void){
    Timer.scheduledTimer(withTimeInterval: after, repeats: false) { timer in
       // done(.successful(timer))
        done(.failure)
    }
}

//正常调用的时候
//run(after: 2) { result in
//    switch result {
//    case .successful(let timer):
//        print(timer)
//    case .failure:
//        fatalError("Never happen")
//    }
//}

//如果对Result 进行扩展，那更能简单不少

extension Result where E == noError {
    var value: T {
        if case .successful(let v) = self {
            return v
        }
        fatalError("Never happen")
    }
}

run(after: 2) {
     print($0.value)
}



