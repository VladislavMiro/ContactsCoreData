import Foundation
import CoreData

final class StorageManager: StorageManagerProtocol {
    
    public static var shared: StorageManagerProtocol = StorageManager()
    
    private init () {}
    
    lazy public var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    lazy public var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    public func createNewEntity(forEntityName name: String, inContext context: NSManagedObjectContext) -> NSManagedObject {
        let entity = NSEntityDescription.insertNewObject(forEntityName: name, into: context)
        return entity
    }
    
    public func fetchData(entityName: String, withPredicate predicate: NSPredicate) -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: entityName)
        var values = [NSManagedObject]()
        
        fetchRequest.predicate = predicate
            
        do {
            values = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return values
    }
    
    public func fetchData(byID id: NSManagedObjectID) -> NSManagedObject {
        return context.object(with: id)
    }
    
    public func fetchAllData(entityName: String) -> [NSManagedObject] {
        return fetchData(entityName: entityName, withPredicate: NSPredicate(value: true))
    }
    
    public func deleteData(entity: NSManagedObject) -> Bool {
        context.delete(entity)
        return saveContext()
    }

    public func saveContext() -> Bool {
        
        if context.hasChanges {
            do {
                try context.save()
                context.refreshAllObjects()
                return true
            } catch {
                let error = error as NSError
                
                print("Unresolved error \(error), \(error.userInfo)")
                context.rollback()
        
                return false
            }
        }
        
        return false
    }
    
}
