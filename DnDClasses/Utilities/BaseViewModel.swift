//
//  BaseViewModel.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: ErrorMessage?
}
