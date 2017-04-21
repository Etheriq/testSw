// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Event.swift instead.

import Foundation
import CoreData

public enum EventAttributes: String {
    case id = "id"
    case place = "place"
    case title = "title"
}

public enum EventRelationships: String {
    case surveys = "surveys"
    case user = "user"
}

open class _Event: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Event"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Event.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var place: String?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var surveys: NSSet

    open func surveysSet() -> NSMutableSet {
        return self.surveys.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var user: User?

}

extension _Event {

    open func addSurveys(_ objects: NSSet) {
        let mutable = self.surveys.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.surveys = mutable.copy() as! NSSet
    }

    open func removeSurveys(_ objects: NSSet) {
        let mutable = self.surveys.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.surveys = mutable.copy() as! NSSet
    }

    open func addSurveysObject(_ value: Survey) {
        let mutable = self.surveys.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.surveys = mutable.copy() as! NSSet
    }

    open func removeSurveysObject(_ value: Survey) {
        let mutable = self.surveys.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.surveys = mutable.copy() as! NSSet
    }

}

