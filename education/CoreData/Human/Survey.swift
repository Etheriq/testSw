import Foundation
import ObjectMapper
import CoreData

@objc(Survey)
open class Survey: _Survey, StaticMappable {
	// Custom logic goes here.
    
    //MARK: - CoreDate requests
    class func getByUniqueIdentifier(_ identifier: NSNumber?) -> Survey? {
        guard let identifier = identifier else { return nil }
        let request = NSFetchRequest<Survey>(entityName: Survey.entityName())
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
        if let survey = Survey.getByUniqueIdentifier(map.JSON["id"] as? NSNumber) {
            return survey
        }
        
        return Survey(managedObjectContext: DataStack.shared.mainContext)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        reason <- map["reason"]
        event <- map["event"]
    }
}
