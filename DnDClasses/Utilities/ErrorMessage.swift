//
//  ErrorMessage.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/5/22.
//

import SwiftUI

struct ErrorMessage: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL       = ErrorMessage(title: Text("Server Error"),
                                            message: Text("There is an error trying to reach the server."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = ErrorMessage(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = ErrorMessage(title: Text("Server Error"),
                                            message: Text("Invalid response from the server."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = ErrorMessage(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid."),
                                            dismissButton: .default(Text("Ok")))
}
