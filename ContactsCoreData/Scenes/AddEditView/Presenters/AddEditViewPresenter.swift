import Foundation

final class AddEditViewPresenter {
    
    private weak var view: AddEditViewProtocol?
    private let dataFormatter: DataFormatterProtocol
    
    init(view: AddEditViewProtocol, dataFormatter: DataFormatterProtocol) {
        self.view = view
        self.dataFormatter = dataFormatter
    }
    
}

extension AddEditViewPresenter: AddEditViewPresenterProtocol {
    
    public func showAlert(response: AddEditViewModels.ShowError.Response) {
        view?.showAlert(viewModel: .init(messageOfError: response.messageOfError))
    }
    
    public func showEmptyFields(response: AddEditViewModels.ShowEmptyFields.Response) {
        view?.showEmptyFields()
        view?.showAlert(viewModel: .init(messageOfError: response.errorMessage))
    }
    
    public func convertDate(response: AddEditViewModels.ConvertDate.Response) {
        if let date = dataFormatter.formatDate(date: response.date) {
            view?.setConvertedDate(viewModel: .init(date: date))
        }
    }
    
    public func convertPhoneNumber(response: AddEditViewModels.ConvertPhoneNumber.Response) {
        let phoneNumber = dataFormatter.formatPhoneNumber(with: "+X (XXX) XXX-XXXX", phone: response.phoneNumber)
        view?.setConvertedPhoneNumber(viewModel: .init(tagOfTextField: response.tagOfTextField,
                                                       phoneNumber: phoneNumber))
    }
    
    public func showData(response: AddEditViewModels.ShowData.Response) {
        
        let contact = response.data
        let birthday = dataFormatter.formatDate(date: contact.getBirthday())
        
        view?.fillTextFields(viewModel: .init(name: contact.getName(),
                                              lastName: contact.getLastName(),
                                              birthday: birthday ?? "",
                                              photo: contact.getPhoto(),
                                              phoneNumber: contact.getPhoneNumber(),
                                              email: contact.getEmail(),
                                              appartment: contact.getHomeAppartment(),
                                              homeCityAddress: contact.getHomeCityAddress(),
                                              homeStreetAddress: contact.getHomeStreetAddress(),
                                              companyName: contact.getCompanyName(),
                                              workingPhoneNumber: contact.getWorkingPhoneNumber(),
                                              workPosition: contact.getWorkingPosition(),
                                              workingCityAddress: contact.getHomeCityAddress(),
                                              workingStreetAddress: contact.getHomeStreetAddress()))
        
    }
    
    public func returnToPreviousView() {
        view?.router.popViewController()
    }
    
}
