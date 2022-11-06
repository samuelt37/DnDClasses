//
//  APIError.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/5/22.
//

import Foundation

enum APIError: Error {
    case invalidData
    case invalidURL
    case invalidResponse
    case unableToComplete
}
