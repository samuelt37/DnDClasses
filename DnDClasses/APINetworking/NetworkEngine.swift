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
    
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T,Error>) -> ()) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else { return }
            

//            if let responseObject = try? JSONDecoder().decode(T.self, from:data) {
//                completion(.success(responseObject))
//            }
//            else {
//                let error = NSError(domain:"", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode respoonse"])
//                completion(.failure(error))
//            }
            completion(.success(String(data: data, encoding: .utf8) as! T))
            
        }
        dataTask.resume()
    }
}
