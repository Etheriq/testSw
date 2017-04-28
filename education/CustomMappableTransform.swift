//
//  CustomMappableTransform.swift
//  education
//
//  Created by Yuriy T on 21.04.17.
//  Copyright © 2017 education.t. All rights reserved.
//

import Foundation
import ObjectMapper

class CustomMappableTransform: NSObject {

    static let eventsMap = TransformOf<NSSet, [[String: Any]]>(
        fromJSON: { (value: [[String: Any]]?) -> NSSet? in
            return NSSet(array: Mapper<Event>().mapArray(JSONArray: value!)!)
    },
        toJSON: {(value: NSSet?) -> [[String: Any]]? in
            if let value = value, let allObjects = value.allObjects as? [Event] {
                return allObjects.toJSON()
            }
            return nil
    })
    
    static let date = TransformOf<Date, String>(
        fromJSON: { (value: String?) -> Date? in
            return EDDateFormatter.defaultTimeDateFormatter.date(from: value!)
    },
        toJSON: {(date: Date?) -> String? in
            return EDDateFormatter.defaultTimeDateFormatter.string(from: date!)
    })
    
    static let boolean = TransformOf<NSNumber, Bool>(fromJSON: { (value: Bool?) -> NSNumber? in
        if let value = value {
            return NSNumber(value: value)
        }
        return nil
    }, toJSON: { (value: NSNumber?) -> Bool? in
        if let value = value {
            return value.boolValue
        }
        return nil
    })
    
    static let floatNumber = TransformOf<NSNumber, String>(fromJSON: { (value: String?) -> NSNumber? in
        if let value = value, let floatValue = Float(value) {
            return NSNumber(value: floatValue)
        }
        return nil
    }, toJSON: { (value: NSNumber?) -> String? in
        if let value = value {
            return String(value.floatValue)
        }
        return nil
    })
    
    static let intNumber = TransformOf<NSNumber, String>(fromJSON: { (value: String?) -> NSNumber? in
        if let value = value, let intValue = Int(value) {
            return NSNumber(value: intValue)
        }
        return nil
    }, toJSON: { (value: NSNumber?) -> String? in
        if let value = value {
            return String(value.intValue)
        }
        return nil
    })
}
