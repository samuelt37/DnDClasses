//
//  ClassListViewModel.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/5/22.
//

import Foundation

class ClassListViewModel: ObservableObject {
    @Published var classList = [DnDClass]()
    @Published var isLoading = false
    @Published var errorMessage: ErrorMessage?
    
    func getClasses() {
        isLoading = true
        NetworkEngine.request(endpoint: DnDEndpoint.getClasses) { (result: Result<DnDClassSet, APIError>) in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    let result = response.results
                    self.classList = result
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.errorMessage = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.errorMessage = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.errorMessage = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.errorMessage = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
