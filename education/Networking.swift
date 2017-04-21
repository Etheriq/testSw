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

class Networking: NSObject {
    
    static let shared = Networking()
    
    private override init() {};
    
    func zzUser() -> Promise<User>  {
        
        return Promise<User>() { fulfill, reject in
            let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
            
            Alamofire.request(URL, method: .get, headers: ["api-key": "qwerty"]).responseObject{ (response: DataResponse<User>) in
                let user = response.result.value
                
                if user != nil {
                    fulfill(user!)
                } else {
                    let error = NSError(domain: "zz", code: 0, userInfo: nil)
                    reject(error)
                }
            }
        }
        
    }

}
