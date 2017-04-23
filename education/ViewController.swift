//
//  ViewController.swift
//  education
//
//  Created by Yuriy T on 21.04.17.
//  Copyright © 2017 education.t. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButton(_ sender: UIButton) {
        
//        Networking.shared.getMe().then { user -> Promise<User> in
//            print(user?.username ?? "default")
//            
//            
//            
//            return Promise<User>() {fulfill, reject in
//                fulfill(user!)
//            }
//            }.then { user -> Void in
//                do {
//                    try DataStack.shared.mainContext.save()
//                } catch {
//                    throw networkErrors.saveToDBError
//                }
//            }.catch { error in
//                print(error.localizedDescription)
//        }
        
        Networking.shared.getMe().then { user -> Void in
            print(user?.username ?? "default")
                do {
                    try DataStack.shared.mainContext.save()
                    print("saved")
                } catch {
                    throw networkErrors.saveToDBError
                }
            }.catch { error in
                print(error.localizedDescription)
        }
        
        
        
        
        
    }

}

