import Foundation
import UIKit

protocol DetailViewRouterProtocol {
    var dataStore: DetailViewDataStoreProtocol { get set }
    func openEditView()
}
