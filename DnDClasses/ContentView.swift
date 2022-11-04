//
//  ContentView.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/4/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        NetworkEngine.request(endpoint: DnDEndpoint.getClasses) { (result: Result<String, Error>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
