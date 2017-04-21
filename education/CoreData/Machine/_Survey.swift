// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Survey.swift instead.

import Foundation
import CoreData

public enum SurveyAttributes: String {
    case id = "id"
    case reason = "reason"
    case title = "title"
}

public enum SurveyRelationships: String {
    case event = "event"
}

open class _Survey: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Survey"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Survey.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var reason: String?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var event: Event?

}

