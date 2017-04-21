import Foundation
import ObjectMapper
import CoreData

@objc(Event)
open class Event: _Event, StaticMappable {
	// Custom logic goes here.
    
    //MARK: - CoreDate requests
    class func getByUniqueIdentifier(_ identifier: NSNumber?) -> Event? {
        guard let identifier = identifier else { return nil }
        let request = NSFetchRequest<Event>(entityName: Event.entityName())
        request.predicate = NSPredicate(format: "id == %@", identifier)
        
        do {
            let objects = try  DataStack.shared.mainContext.fetch(request)
            return objects.first
        } catch {
            debugPrint(error)
        }
        return nil
    }
    
    //MARK: - Mappable
    public static func objectForMapping(map: Map) -> BaseMappable? {
        if let event = Event.getByUniqueIdentifier(map.JSON["id"] as? NSNumber) {
            return event
        }
        
        return Event(managedObjectContext: DataStack.shared.mainContext)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        place <- map["plase"]
        user <- map["user"]
        
    }
}
