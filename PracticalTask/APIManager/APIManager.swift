//
//  APIManager.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import Foundation
import Alamofire
import ObjectMapper

struct SuccessReponse<T>{
    var data: T
    var message: String?
}
struct FailureResponse{
    var message: String?
    var error: Error?
}
typealias ResponseHandeler<T> = (SuccessReponse<T>?,FailureResponse?) -> Void

class APIManager{
    
    static let shared = APIManager()
    
    private init(){}
    
    private lazy var sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120 // Timeout interval in seconds
        
        return Session(configuration: configuration)
    }()
    
    func api_request<T: Mappable>(
        task: String,
        headers: HTTPHeaders? = nil,
        param: [String: Any]? = nil,
        completion: @escaping (ResponseHandeler<T>)
    ) {
        URLCache.shared.removeAllCachedResponses()
        guard let url = URL(string: task) else {
            completion(nil, FailureResponse(message: Constant.staticText.invalidURL.rawValue, error: nil))
            return
        }
        
        print("URL : \(url)")
        print("PARAMETERS : \(String(describing: param))")
        
        sessionManager.request(url, parameters: param, encoding: JSONEncoding.default, headers: headers).responseData { response in
            
            guard response.error == nil else {
                self.handleError(error: response.error!, completion: completion)
                return
            }
            
            guard let data = response.value else {
                DispatchQueue.main.async {
                    completion(nil, FailureResponse(message: "", error: nil))
                }
                return
            }
            
            do {
                if let rawString = String(data: data, encoding: .utf8) {
                    print("🔥 RAW JSON RESPONSE:\n\(rawString)")
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    DispatchQueue.main.async {
                        completion(nil, FailureResponse(message: "", error: nil))
                    }
                    return
                }
                
                print("RESPONSE JSON:", json)
                let status = (json["status"] as? String) ?? ""
                let message = (json["message"] as? String) ?? ""
                
                if let mapped = Mapper<T>().map(JSONObject: json) {
                    DispatchQueue.main.async {
                        completion(SuccessReponse(data: mapped, message: message), nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil, FailureResponse(message: "", error: nil))
                    }
                    
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, FailureResponse(message: "JSON decoding error: \(error.localizedDescription)", error: error))
                }
            }
        }
        
    }
    func handleError<T: Mappable>(error: AFError, completion: ResponseHandeler<T>?) {
        let nsError = error.underlyingError as NSError?
        let code = nsError?.code ?? 500
        let message = nsError?.localizedDescription ?? error.localizedDescription
        
        let apiError: APIError
        let responseMessage: String
        
        switch code {
        case NSURLErrorTimedOut:
            apiError = .requestTimeOut
            responseMessage = Constant.staticText.requestTimeOut.rawValue
            
        case NSURLErrorCancelled:
            apiError = .requestCancelled
            responseMessage = Constant.staticText.requestCancel.rawValue
            
        case NSURLErrorNotConnectedToInternet:
            apiError = .noInternetConnection(Constant.staticText.noInternetConnection.rawValue)
            responseMessage = Constant.staticText.noInternetConnection.rawValue
            
        default:
            apiError = .netwrokError(message)
            responseMessage = message
        }
        
        let failureResponse = FailureResponse(
            message: responseMessage,
            error: apiError
        )
        DispatchQueue.main.async {
            completion?(nil, failureResponse)
        }
    }
}
enum APIError: Error{
    
    case invalidURL
    case requestTimeOut
    case jsonPasrsonFalied
    case statusCodeError
    case netwrokError(String)
    case noInternetConnection(String)
    case requestCancelled
}
