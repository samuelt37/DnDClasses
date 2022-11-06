//
//  Spells.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import Foundation

struct SpellSet: Codable {
    var count: Int
    var results: [Spell]
}

struct Spell: Codable {
    var index: String
    var name: String
    var url: String
}
