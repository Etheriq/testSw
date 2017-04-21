//
//  DateFormatter.swift
//  education
//
//  Created by Yuriy T on 21.04.17.
//  Copyright © 2017 education.t. All rights reserved.
//

import Foundation

class EDDateFormatter: NSObject {
    static let defaultTimeDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter
    }()
}
