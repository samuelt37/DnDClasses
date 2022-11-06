//
//  ClassDetailView.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import SwiftUI

struct ClassDetailView: View {
    @StateObject private var viewModel: ClassDetailViewModel
    
    init(dndClass: DnDClass) {
        self._viewModel = StateObject(wrappedValue: ClassDetailViewModel(dndClass: dndClass))
    }
    
    var body: some View {
        ZStack {
            List(viewModel.spells, id: \.index) { spell in
//                Text("\(spell.name)")
//               ClassDetailRow(spell: spell)
            }.task {
                viewModel.getSpells()
            }.alert(item: $viewModel.errorMessage) { errorMessage in
                Alert(title: errorMessage.title, message: errorMessage.message, dismissButton: errorMessage.dismissButton)
            }
        }
        .navigationTitle("\(viewModel.dndClass.name) Spells")
    }
}

//struct ClassDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassDetailView()
//    }
//}
