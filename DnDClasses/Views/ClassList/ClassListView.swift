//
//  ContentView.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/4/22.
//

import SwiftUI

struct ClassListView: View {
    @StateObject private var viewModel = ClassListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.classList, id: \.index) { dndclass in
                    NavigationLink {
                        ClassDetailView(dndClass: dndclass)
                    } label: {
                        ClassListRow(dndClass: dndclass.name)
                    }
                }
                .navigationTitle("Classes")
            }.task {
                viewModel.getClasses()
            }.alert(item: $viewModel.errorMessage) { errorMessage in
                Alert(title: errorMessage.title, message: errorMessage.message, dismissButton: errorMessage.dismissButton)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassListView()
    }
}
