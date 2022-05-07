import Foundation
import CoreData

protocol StorageManagerProtocol {
    
    var persistentContainer: NSPersistentContainer { get }
    var context: NSManagedObjectContext { get }
    
    func createNewEntity(forEntityName name: String, inContext context: NSManagedObjectContext) -> NSManagedObject
    func fetchData(entityName: String, withPredicate predicate: NSPredicate) -> [NSManagedObject]
    func fetchAllData(entityName: String) -> [NSManagedObject]
    func fetchData(byID id: NSManagedObjectID) -> NSManagedObject
    func saveContext() -> Bool
    func deleteData(entity: NSManagedObject) -> Bool
    
}
