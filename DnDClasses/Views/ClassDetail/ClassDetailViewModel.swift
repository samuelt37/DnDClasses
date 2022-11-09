//
//  ClassDetailViewModel.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import Foundation

struct getSpellTask {
    var endpoint: Endpoint
    
    func request() async throws -> SpellDescription {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let (data, _) = try await URLSession.shared.data(from: url)
        if let responseObject = try? JSONDecoder().decode(SpellDescription.self, from:data) {
            print(responseObject)
            return responseObject
        }
        else {
            throw APIError.invalidData
        }
    }
}

class ClassDetailViewModel: BaseViewModel {
    @Published var dndClass: DnDClass
    @Published var spells = [SpellDescription]()
    
    init(dndClass: DnDClass){
        self.dndClass = dndClass
    }
    
    func getSpells() async throws {
        isLoading = true
        NetworkEngine.request(endpoint: DnDEndpoint.getClassSpells(dndClass: dndClass.name.lowercased())) { (result: Result<SpellSet, APIError>) in
            switch result {
            case .success(let response):
                var tasks = [getSpellTask]()
                for spell in response.results {
                    let spellname = spell.name.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
                    tasks.append(getSpellTask(endpoint: DnDEndpoint.getSpellInfo(spellName: spellname.lowercased())))
                }
                let allTasks = tasks
                Task {
                    do {
                        let allResults = try await withThrowingTaskGroup(of: SpellDescription?.self,
                                                             returning: [SpellDescription].self,
                                                             body: { taskGroup in
                            for task in allTasks {
                                taskGroup.addTask {
                                    let value = try await task.request()
                                    return value
                                }
                            }
                            
                            var taskResults = [SpellDescription]()
                            for try await result in taskGroup {
                                guard let result = result else {
                                    continue
                                }
                                taskResults.append(result)
                            }
                            return taskResults.sorted {$0.name < $1.name}
                        })
                        
                        print(allResults)
                        self.spells = allResults
                        self.isLoading = false
                    }
                    catch {
                        
                    }
                }
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
    
    func getSpellDescriptions(spells:[Spell]) async throws {
    }
        
}
