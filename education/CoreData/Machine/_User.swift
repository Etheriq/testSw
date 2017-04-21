// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.swift instead.

import Foundation
import CoreData

public enum UserAttributes: String {
    case birthday = "birthday"
    case email = "email"
    case id = "id"
    case username = "username"
}

public enum UserRelationships: String {
    case events = "events"
}

open class _User: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "User"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _User.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var birthday: Date?

    @NSManaged open
    var email: String?

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var username: String?

    // MARK: - Relationships

    @NSManaged open
    var events: NSSet

    open func eventsSet() -> NSMutableSet {
        return self.events.mutableCopy() as! NSMutableSet
    }

}

extension _User {

    open func addEvents(_ objects: NSSet) {
        let mutable = self.events.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.events = mutable.copy() as! NSSet
    }

    open func removeEvents(_ objects: NSSet) {
        let mutable = self.events.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.events = mutable.copy() as! NSSet
    }

    open func addEventsObject(_ value: Event) {
        let mutable = self.events.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.events = mutable.copy() as! NSSet
    }

    open func removeEventsObject(_ value: Event) {
        let mutable = self.events.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.events = mutable.copy() as! NSSet
    }

}

