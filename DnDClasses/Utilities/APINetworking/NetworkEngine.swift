//
//  NetworkEngine.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/4/22.
//

import Foundation

class NetworkEngine {
    ///Executes the api call, decodes the response into Codable object
    /// - Paramters:
    ///     - endpoint: the url
    ///     - completion: the response
    
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T,APIError>) -> ()) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let _ =  error {
                completion(.failure(.unableToComplete))
                return
            }
                       
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
           
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            if let responseObject = try? JSONDecoder().decode(T.self, from:data) {
                completion(.success(responseObject))
            }
            else {
                completion(.failure(.invalidData))
            }
        }
        dataTask.resume()
    }
}
