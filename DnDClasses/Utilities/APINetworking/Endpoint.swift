//
//  Endpoint.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/4/22.
//

import Foundation

protocol Endpoint {
    //HTTP, HTTPS
    var scheme: String { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    //[URLQueryItem(name: "api_key", value: API_KEY)]
    var parameters: [URLQueryItem] { get }
    
    // GET, POST, ...
    var method: String { get }
}
