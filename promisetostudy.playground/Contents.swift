import Cocoa
/***
            ---->  Sources.swift
PromiseKit
            ---->  Sources.objc
 
 swift:
 1.Promise.swift
 2.Guarantee.swift  保证，担保
 3.Thenable.swift
 4.Catchable.swift
 
 
    Promise.swift
 
 Promise <T>   ----  <T> 代表的是 什么呢？  T代表 : 元组 Result 是枚举
 
 

 objc: 可能涉及和swift进行混合编译，具体还没有仔细看。

 **/

/**
 *1.假设我们要写一个登录操作的函数
 *2.闭包作为参数
 *3.网络请求之后的回调  模拟的时候使用gcd的异步执行，4秒之后进行回调
 **/

func login(userName:String,password:String,completionHandle:@escaping(_ token:String?,_ userId:String?)->Void){
    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
        completionHandle("123345","dafd")
    }
}

typealias CompletionHandle = (String?,String?)-> Void
func login1(userName:String,password:String,completionHandle:@escaping CompletionHandle){
    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
        completionHandle("00000000","zzzzzzzzzz")
    }
}

//login1(userName: "123", password: "123"", completionHandle:     )
login(userName: "123", password:"456") { (token, userId) in
    print("login")
    print(token!)
    print(userId!)
}

login1(userName: "12345", password: "678910") { (token, userId) in
    print("login1")
    print(token!)
    print(userId!)
}



//模拟一个简单的网络请求的过程
let request = URLRequest.init(url: NSURL.init(fileURLWithPath: "http://www.baidu.com") as URL)

func handle(data:Data) {
    
}

func handle(error:Error) {

}

//方法调用，回调
//response 只要跟server端有了通信，无论正确与否，response都会有数据。
/*
 *崩溃：不会存在data和error都是nil或者非nil的情况  但是编译器无法 静态 确认这个事实  编译器没有制止我们在错误的if 语句中 对nil 进行解包，这种行为将以外导致崩溃。
 *
 */
URLSession.shared.dataTask(with: request) {
    (data, response, error) in
    if error == nil {
       handle(data: data!)   //data 如果 是 nil ,那么 data!解包操作会导致程序崩溃
    }
    else {
        handle(error: error!)
    }
}

/**
 *改善方法：
 *用泛型，将可能的返回值包装起来 因为无非是成功失败二选一，所以借此把不必要的可选值去掉。
 */

enum Result<T,E:URLResponse> {
    case successful(T)
    case failure(E)
}

/*
 *把泛型用在包装 URLSession 上试一试
 *不知道为什么写下面代码的时候，没有提示
 *猫神说 response 无论 failure 还是  success 都会返回的 所以 Result这个枚举 里面的元组，进行了修改
 */
extension URLSession {
    func dataTask(with request:URLRequest,completionHandler:@escaping (Result<(Data,URLResponse),URLResponse>) -> Void) -> URLSessionDataTask {
        return dataTask(with: request) {
            data,response,error in
                if error != nil {
                    completionHandler(.failure(response!))
                }
                else {
                    completionHandler(.successful((data!,response!)))
            }
        }
    }
}

/*
 *调用试试
 *枚举 + 元组 的这种方式，参数调用不会写
 */




