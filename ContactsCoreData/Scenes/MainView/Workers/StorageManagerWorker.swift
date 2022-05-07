import Foundation

final class MainViewSMWorker {
    
    private let storageManager = StorageManager.shared
    
}

extension MainViewSMWorker: MainViewSMWorkerProtocol {
    
    public func fetchAllData() -> [ContactProtocol] {
        var contacts = storageManager.fetchAllData(entityName: "Contact") as! [ContactProtocol]
        
        contacts.sort { (value1, value2) -> Bool in
            return (value1.getName() < value2.getName())
        }
        
        return contacts
    }
    
    public func fetchData(request: String) -> [ContactProtocol] {
        let predicate = NSPredicate(format: "name CONTAINS[c] %@", request)
        let contacts = storageManager.fetchData(entityName: "Contact", withPredicate: predicate) as! [ContactProtocol]
        
        return contacts
    }
    
    public func deleteData(contact: ContactProtocol) -> Bool {
        if storageManager.deleteData(entity: contact) {
            return true
        } else {
            return false
        }
    }
    
}
