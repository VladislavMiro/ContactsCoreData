import Foundation

final class AddEditSMWorker {
    
    private let storageManager: StorageManagerProtocol = StorageManager.shared
    
    private func createContact() -> ContactProtocol {
        
        let context = storageManager.context
        let jobEntity = Job(context: context)
        let addressEntity = Address(context: context)
        let contact = Contact(context: context)
        
        jobEntity.address = addressEntity
        contact.job = jobEntity
        contact.address = addressEntity
        
        return contact
        
    }
    
}

extension AddEditSMWorker: AddEditSMWorkerProtocol {
    
    public func appendData(values: [String : Any?]) -> Bool {
        let entity = createContact()
        
        for element in values {
            entity.setValue(element.value, forKeyPath: element.key)
        }
        
        return storageManager.saveContext()
    }
    
    
    public func changeData(newValues: [String : Any?], for contact: ContactProtocol) -> Bool {
        
        for values in newValues {
            contact.setValue(values.value, forKeyPath: values.key)
        }
        
        if storageManager.saveContext() {
            return true
        } else {
            return false
        }

    }
    
}
