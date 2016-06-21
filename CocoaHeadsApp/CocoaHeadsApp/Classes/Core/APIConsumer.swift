import UIKit
import Moya
import Unbox

enum APIErrors :ErrorType {
    case BadAPIResponse(Int?,String?)
    case UndefinedBehavior(NSData)
}

/**
 The APIConsumer is responsable for excuting the request and parse the response to the appropriate type
*/
class APIConsumer<Target:TargetType>: NSObject {
    
    let provider :MoyaProvider<Target>
    
    init(_ aProvider :MoyaProvider<Target>) {
        provider = aProvider
        super.init()
    }
    
    func consume<T :Unboxable>(target :Target, success:(T -> Void) = { _ in }, failure:(ErrorType -> Void) = { error in logger.error("\(error)") }) -> Cancellable {
        let cancellable = provider.request(target) { (result) -> () in
            
            switch result {
            case .Failure(let error):
                failure(error)
            case .Success(let response):
                let statusCode = response.statusCode
                let data = response.data
                guard statusCode == 200 else {
                    return failure(APIErrors.BadAPIResponse(statusCode, String(data: data, encoding: NSUTF8StringEncoding)))
                }
                let parser = ObjectParser<T>(jsonData: data)
                let parsedResponse = parser.parsedResponse()
                if let validResponse = parsedResponse.response {
                    success(validResponse)
                } else if let error = parsedResponse.error {
                    failure(error)
                } else {
                    failure(APIErrors.UndefinedBehavior(data))
                }
            }
            
        }
        return cancellable
    }
    
}