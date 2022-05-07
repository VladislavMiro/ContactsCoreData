import Foundation
import CoreData

protocol ContactProtocol: NSManagedObject {
    //getters
    func getID() -> NSManagedObjectID
    func getPhoto() -> Data?
    func getName() -> String
    func getLastName() -> String
    func getBirthday() -> Date?
    func getPhoneNumber() -> String
    func getEmail() -> String
    func getHomeCityAddress() -> String
    func getHomeStreetAddress() -> String
    func getHomeAppartment() -> String
    func getCompanyName() -> String
    func getWorkingPosition() -> String
    func getWorkingPhoneNumber() -> String
    func getWorkingCityAddress() -> String
    func getWorkingStreetAddress() -> String
}

