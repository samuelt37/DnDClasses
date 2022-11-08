//
//  ClassDetailViewModel.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import Foundation

class ClassDetailViewModel: BaseViewModel {
    @Published var dndClass: DnDClass
    @Published var spells = [SpellDescription]()
    
    init(dndClass: DnDClass){
        self.dndClass = dndClass
    }
    
    func getSpells() {
        isLoading = true
        NetworkEngine.request(endpoint: DnDEndpoint.getClassSpells(dndClass: dndClass.name.lowercased())) { (result: Result<SpellSet, APIError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let result = response.results
                    self.getSpellDescription(spells:result)
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
    
    func getSpellDescription(spells:[Spell]) {
        let group = DispatchGroup()
        for spell in spells {
            group.enter()
            //spell name needs to replace " " with "-"
            let spellname = spell.name.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            NetworkEngine.request(endpoint: DnDEndpoint.getSpellInfo(spellName: spellname.lowercased())) { (result: Result<SpellDescription, APIError>) in
                group.leave()
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        self.spells.append(response)
                    case .failure:
                        break
                    }
                }
            }
        }
        
        //Update the UI
        group.notify(queue: .main, execute: {
            self.isLoading = false
        })
    }
}
