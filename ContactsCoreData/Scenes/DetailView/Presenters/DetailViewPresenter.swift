import Foundation

final class DetailViewPresenter {
    
    private weak var view: DetailViewProtocol?
    private let dataFormatter: DataFormatterProtocol
    
    init(view: DetailViewProtocol, dataFormatter: DataFormatterProtocol) {
        self.view = view
        self.dataFormatter = dataFormatter
    }

}

extension DetailViewPresenter: DetailViewPresenterProtocol {
    
    public func showData(response: DetailViewModels.ShowContact.Response) {
        
        let contact = response.contact
        let birthday = dataFormatter.formatDate(date: contact.getBirthday()) ?? ""
        
        view?.fillData(viewModel: .init(name: contact.getName(),
                                        lastName: contact.getLastName(),
                                        birthday: birthday,
                                        photo: contact.getPhoto(),
                                        phoneNumber: contact.getPhoneNumber(),
                                        email: contact.getEmail(),
                                        appartment: contact.getHomeAppartment(),
                                        homeCityAddress: contact.getHomeCityAddress(),
                                        homeStreetAddress: contact.getHomeStreetAddress(),
                                        companyName: contact.getCompanyName(),
                                        workingPhoneNumber: contact.getWorkingPhoneNumber(),
                                        workPosition: contact.getWorkingPosition(),
                                        workingCityAddress: contact.getWorkingCityAddress(),
                                        workingStreetAddress: contact.getWorkingStreetAddress()))
        
    }
    
}
