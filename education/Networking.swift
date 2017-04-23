//
//  Networking.swift
//  education
//
//  Created by Yuriy T on 21.04.17.
//  Copyright © 2017 education.t. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import PromiseKit

public enum networkErrors : Error {
    case requestError
    case saveToDBError
    case unknowError
}

class Networking: NSObject {
    
    static let shared = Networking()
    
    private override init() {};
    
    func getMe() -> Promise<User?>  {
        
        return Promise<User?>() { fulfill, reject in
            let URL = "http://192.168.0.102:3001/me"
            
            Alamofire.request(URL, method: .get, headers: ["api-key": "qwerty"]).responseObject(keyPath:"user"){ (response: DataResponse<User>) in
                guard let user = response.result.value else {
                    reject(networkErrors.requestError)
                    return
                }
                
                fulfill(user)
//                
//                if user != nil {
//                    fulfill(user!)
//                } else {
//                    let error = NSError(domain: "zz", code: 0, userInfo: nil)
//                    reject(error)
//                }
            }
        }
        
    }

}
