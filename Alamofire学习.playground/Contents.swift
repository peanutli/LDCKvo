import Cocoa

/**
 * Alamofire 学习
 *
 * 1.URLLoading System  (URLoading 五个class)
        五个辅助类  1.Authentication  2.Configuration 3.protocol 4. cache 5 .cacheManager
 
    public enum AF {}   为什么一个swift文件里面 把方法都写到了枚举里面
 */

/*
 Core :
 AFError,
 AFResult,
 HTTPHeaders,
 HTTPMethod
 Notifications,
 ParameterEncoder,
 ParameterEncoding,
 Protector,
 Request,
 RequestTastMap,
 Response,
 Session,
 SessionDelegate
 
 Features :
 AlamtofireExtended
 CashResponseHandler
 EventMonitor
 MultipartFormData
 MultipartUpload
 NetworkReachabilityManager
 RedirectHandler
 RequestInterceptor
 ResponseSerialization
 RetryPolicy
 ServerTrustEvaluation
 Validation
 *
 */

/*
  AF.request ----->  Session  ---->  Request   HttpHeader ,HTTPMethod, ParameterEncoder , RequestInterceptor
                                     Response  ResponseSerialization  ---- 在  ResponseSerialization .swift文件里有 对 DataRequest 的 extension 扩展
 **/


/**
 *SessionDelegate 作用  SessionDelegate作用是什么呢？ 代理：委托别人完成一些事情
 
 SessionStateProvider：
 serverTrustManager 安全
 RedirectHandler 重定向
 CachedResponseHandler 缓存
 Request  请求
 didGatherMetricsForTask 任务
 didCompleteTask 任务完成
 credential 证书
 cancelRequestsForSessionInvalidation 取消的代理
 
 ------RequestDelegate------  重新请求
 
 RequestDelegate.swift
 Session.swift
 ResponseSerialization.swift
 
 Request.swift（声明了delegate方法）
 Session.request（发送请求，实现了RequestDelegate的方法）
 Responseserializaation(处理请求结果，调用Session.swift里面的实现)  Responseserializaation 里面扩展了 DataRequest ,DataReqeust 继承了 Request   RequestDelegate
 
 个人感觉在Responseserializaation里面去进行扩展DataReqeust 不好， 感觉调用起来，有点乱。
 
 
 --------SessionDelegate----------
 
 sessionDelegate 声明的协议方法
 session.swift 里面实现？
 cancelRequestsForSessionInvalidation比如这个协议方法声明是在SessionDelegate里面，但是实现是在session.swift里面
 protocol 里面的属性对象， 能调用下面声明的协议方法的原因？
 Session:SessionStateProvider  实现delegate 方法
 
 1.任务里查找 request
 2.得到这个任务
 3.任务完成
 4.取消请求 request
 5.证书
 
 class SessionDelegate :
 NSObject
 NSURLSessionDelegate
 NSURLSessionDataTaskDelegate
 NSURLSessionDownLoadDelegate
 
 
 request，didGatherMetricsForTask，didCompleteTask，credentialcancelRequestsForSessionInvalidation
 
 session 里面的代理方法的实现，在哪里调用？什么情况下触发调用逻辑
 
 ***/


/* EventMonitor  事件监听器
 *
 *
 *
 *
 */


/**
 *Queue:
 *rootQueue,requestQueue,serializationQueue  没看懂
 *
 */

/*
    嵌套枚举
 
 *enum 
 */




