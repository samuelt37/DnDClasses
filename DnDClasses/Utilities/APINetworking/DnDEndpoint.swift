//
//  DnDEndpoint.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/4/22.
//

import Foundation

enum DnDEndpoint : Endpoint {
    case getClasses
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "www.dnd5eapi.co"
        }
    }
    
    var path: String {
        switch self {
        case .getClasses:
            return "/api/classes"
        }
    }
    
    var parameters: [URLQueryItem] {        
        switch self {
        default:
            return []
//        case .search(let searchText):
//            return [URLQueryItem(name:"searchText", value: searchText),
//                    URLQueryItem(name:"api_key", value: apiKey)]
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
}
