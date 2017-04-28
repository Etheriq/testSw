import Foundation
import ObjectMapper
import CoreData

@objc(User)
open class User: _User, StaticMappable {
	// Custom logic goes here.
    
    //MARK: - CoreDate requests
    class func getByUniqueIdentifier(_ identifier: NSNumber?) -> User? {
        guard let identifier = identifier else { return nil }
        let request = NSFetchRequest<User>(entityName: User.entityName())
        request.predicate = NSPredicate(format: "id == %@", identifier)
        
        do {
            let objects = try  DataStack.shared.mainContext.fetch(request)
            return objects.first
        } catch {
            debugPrint(error)
        }
        return nil
    }
    
    var surveyIn: Survey?
    
    //MARK: - Mappable
    public static func objectForMapping(map: Map) -> BaseMappable? {
        if let user = User.getByUniqueIdentifier(map.JSON["id"] as? NSNumber) {
            return user
        }
        
        return User(managedObjectContext: DataStack.shared.mainContext)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        email <- map["email"]
        birthday <- (map["birthday"], CustomMappableTransform.date)
        events <- (map["events"], CustomMappableTransform.eventsMap)
        surveyIn <- map["survey"]
    }
}
