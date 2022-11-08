//
//  DnDEndpoint.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/4/22.
//

import Foundation

enum DnDEndpoint : Endpoint {
    case getClasses
    case getClassSpells(dndClass: String)
    case getSpellInfo(spellName: String)
    
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
        case .getClassSpells(let dndClass):
            return "/api/classes/\(dndClass)/spells"
        case .getSpellInfo(spellName: let spellName):
            return "/api/spells/\(spellName)"
        }
    }
    
    var parameters: [URLQueryItem] {        
        switch self {
        default:
            return []
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
}
