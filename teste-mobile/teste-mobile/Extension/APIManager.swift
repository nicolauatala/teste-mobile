//
//  APIManager.swift
//  teste-mobile
//
//  Created by Nicolau Atala Pelluzi on 24/10/17.
//  Copyright © 2017 Nicolau Atala Pelluzi. All rights reserved.
//

import Alamofire

//MARK: - API Manager
let kTimeOutPeriod:TimeInterval = 10
let kKeyWarningResponse = "avisos"
let kKeyErrorResponse = "erros"
let kKeyTextErrorResponse = "texto"
let kMessageServerUnavailable = "Servidor Indisponível. Tente novamente mais tarde."
let kMessageNetworkError = "Sem conexão com a Internet."
let kMessageServerError = "Sem conexão com o servidor."
let kKeyTokenHeader = "token"

class APIManager {
    
    static let shared = APIManager()
    
    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return Alamofire.SessionManager(configuration: configuration)
        }()
    
    static func getRequest(forUrl url: String, withParameters parameters: [String : Any]? = nil, inBody:Bool=false, haveHeader: Bool? = nil, completion: @escaping (_ success: Bool, _ message: String?, _ response: Dictionary<String, AnyObject>?) -> Void) {
        
//        var header = generateHeaderRequest(haveHeader)
        
        var enconding:ParameterEncoding = URLEncoding.default
        
        if inBody {
            enconding = JSONEncoding.default
        }
        
        self.request(url, forMethod: .get, withParameters: parameters, withEncoding: enconding, withHeaders: nil) { (success, message, response) in
            completion(success,message,response)
        }
    }
    
    static func postRequest(forUrl url: String, withParameters parameters: [String : Any]? = nil, inBody:Bool=false, haveHeader: Bool? = nil, completion: @escaping (_ success: Bool, _ message: String?, _ response: Dictionary<String, AnyObject>?) -> Void) {
        
        //let headers = generateHeaderRequest(haveHeader)
        
        var enconding:ParameterEncoding = URLEncoding.default
        
        if inBody {
            enconding = JSONEncoding.default
        }
        
        self.request(url, forMethod: .post, withParameters: parameters, withEncoding: enconding, withHeaders: nil) { (success, message, response) in
            completion(success,message,response)
        }
    }
    
    private static func request(_ url: String, forMethod method: HTTPMethod, withParameters parameters: [String : Any]? = nil, withEncoding encoding:ParameterEncoding=URLEncoding.default, withHeaders headers: [String : String]? = nil, completion: @escaping (_ success: Bool, _ message: String?, _ response: Dictionary<String, AnyObject>?) -> Void) {
        
        if NetworkReachability.isReachable() {
            Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response: DataResponse<Any>) in
                switch  response.result {
                    
                case .success:
                    
                    let data = response.result.value as! Dictionary<String, AnyObject>
                    
                    switch response.response!.statusCode {
                        
                    case 200:
                        
                        //If have an error
                        if let haveError = data[kKeyWarningResponse] {
                            
                            var messageError = ""
                            
                            if let errors = haveError[kKeyErrorResponse] as? Array<Dictionary<String,AnyObject>> {
                                
                                for error in errors {
                                    if let errorMessage = error[kKeyTextErrorResponse] as? String {
                                        messageError += errorMessage
                                    }
                                }
                                
                            }
                            
                            if (messageError.characters.count > 0) {
                                completion(false, messageError,nil)
                                return
                            }
                        }
                        
                        //Return data
                        completion(true,nil,data)
                        
                    default:
                        
                        completion(false,kMessageServerUnavailable,nil)
                    }
                    
                case .failure(_):
                    
                    completion(false,kMessageNetworkError,nil)
                }
            }
        } else {
            completion(false,kMessageNetworkError,nil)
        }
    }
}

extension Dictionary {
    func mergedWith(otherDictionary: [Key: Value]) -> [Key: Value] {
        var mergedDict: [Key: Value] = [:]
        [self, otherDictionary].forEach { dict in
            for (key, value) in dict {
                mergedDict[key] = value
            }
        }
        return mergedDict
    }
}
