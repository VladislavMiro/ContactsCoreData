import Foundation
import UIKit

protocol MainViewProtocol: class {
    
    var interactor: MainViewInteractorProtocol! { get set }
    var router: MainViewRouterProtocol! { get set }
    
    func showFetchedData(viewModel: MainViewModels.FetchData.ViewModel)
    func deleteRow(viewModel: MainViewModels.DeleteData.ViewModel)
    func showAlert(viewModel: MainViewModels.ShowError.ViewModel)

}
