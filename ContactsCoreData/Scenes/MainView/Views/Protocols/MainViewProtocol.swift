import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    
    var interactor: MainViewInteractorProtocol! { get set }
    var router: MainViewRouterProtocol! { get set }
    
    func showFetchedData(viewModel: MainViewModels.FetchData.ViewModel)
    func deleteRow(viewModel: MainViewModels.DeleteData.ViewModel)
    func showAlert(viewModel: MainViewModels.ShowError.ViewModel)

}
