//
//  ClassDetailViewModel.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import Foundation

class ClassDetailViewModel: BaseViewModel {
    @Published var dndClass: DnDClass
    @Published var spells = [Spell]()
    
    init(dndClass: DnDClass){
        self.dndClass = dndClass
    }
    
    
    func getSpells() {
        isLoading = true
        NetworkEngine.request(endpoint: DnDEndpoint.getClassSpells(dndClass: dndClass.name.lowercased())) { (result: Result<SpellSet, APIError>) in
            DispatchQueue.main.async {
                self.isLoading = false

                switch result {
                case .success(let response):
                    let result = response.results
                    self.spells = result
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
