import Cocoa

/*
 *错误类型扩展
 *这种方式，提供他人api的时候，很方便，直接看枚举定义的member就可以
 */
enum UserRegisterError : Error {    //在编译器上进行错误类型的确定
    case duplicatedUsername
    case unsafePassword
}

public enum Result<User,UserRegisterError> {
    case successful(User)
    case failure(UserRegisterError)
}

class UserService {
    func register(with user:String,password:String,completionHandle: @escaping (Result<(String,String),UserRegisterError>)->Void) {
        
        //成功
        completionHandle(.successful(("123","abc")))
        //失败
       // completionHandle(.failure(UserRegisterError.unsafePassword))
        
    }
}

let userService = UserService()
userService.register(with: "user", password: "password") {
    result in
    
    switch result {
    case .successful(let user):
        print("User registered: \(user)")
    case .failure(let error):
        if error == .duplicatedUsername {
            print("error:duplicatedUsername")
        }
        else if error == .unsafePassword {
             print("error:unsafePassword")
        }
    }
}
