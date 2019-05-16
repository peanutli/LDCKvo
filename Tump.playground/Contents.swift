import Cocoa


//常用的变成范式
enum Result<T,R:URLResponse> {
    case successful(T) //成功的时候  参数的数据格式，是一个元组
    case failure(R)  //失败的时候   参数的数据格式，是一个URLResponse
}

//这是一个枚举  简单封装了返回的两种情况，成功或者失败，


/**
 *1.下面闭包 目的 是用来 做异步回调 状态和数据
 *2.通过枚举 封装回调的状态和数据  作为参数
 *3.调用的时候，接收回调，通过枚举值判断  成功  失败
 **/

extension URLSession{
    func dataTask(with request:URLRequest,completionHandler: @escaping (Result<(Data,URLResponse),URLResponse>)->Void) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: { (data, response, error) in
            if error == nil {
                print("成功")
                completionHandler(.successful((data!,response!)))
            }
            else {
                print("失败")
                completionHandler(.failure(response!))
            }
        })
    }
}

var request = URLRequest.init(url: URL.init(fileURLWithPath: "http://www.baidu.com"))

URLSession.shared.dataTask(with: request) { (result) in
    switch result {
    case .successful((let data,let response)):
            print("成功")
            print(data)
            print(response)
    case .failure(let response):
            print("失败")
            print(response)
    }
}
