import Foundation
import CoreData


extension Contact: ContactProtocol  {
    
    public func getID() -> NSManagedObjectID {
        return objectID
    }
    
    public func getPhoto() -> Data? {
        return photo
    }
    
    public func getName() -> String {
        guard let value = name else { return "" }
        return value
    }
    
    public func getLastName() -> String {
        guard let value = lastName else { return "" }
        return value
    }
    
    public func getBirthday() -> Date? {
        return birthday
    }
    
    public func getPhoneNumber() -> String {
        guard let value = phoneNumber else { return "" }
        return value
    }
    
    public func getEmail() -> String {
        guard let value = email else { return "" }
        return value
    }
    
    public func getHomeCityAddress() -> String {
        guard let value = address?.city else { return "" }
        return value
    }
    
    public func getHomeStreetAddress() -> String {
        guard let value = address?.street else { return "" }
        return value
    }
    
    public func getHomeAppartment() -> String {
        guard let value = address?.appartment else { return "" }
        return value
    }
    
    public func getCompanyName() -> String {
        guard let value = job?.name else { return "" }
        return value
    }
    
    public func getWorkingPosition() -> String {
        guard let value = job?.position else { return "" }
        return value
    }
    
    public func getWorkingPhoneNumber() -> String {
        guard let value = job?.phoneNumber else { return "" }
        return value
    }
    
    public func getWorkingCityAddress() -> String {
        guard let value = job?.address?.city else { return "" }
        return value
    }
    
    public func getWorkingStreetAddress() -> String {
        guard let value = job?.address?.street else { return "" }
        return value
    }

}

