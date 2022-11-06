//
//  Classes.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/5/22.
//

import Foundation

struct DnDClassSet: Codable {
    var count: Int
    var results: [DnDClass]
}


struct DnDClass: Codable {
    var index: String
    var name: String
    var url: String
}
