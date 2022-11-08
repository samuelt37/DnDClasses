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
                ClassDetailRow(spellName: spell.name, spellDesc: spell.desc)
            }
            .emptyListPlaceholder(items: viewModel.spells,
                                   placeholder: AnyView(ListPlaceholderView(placeholder: "No spells found.")))
            .task {
                viewModel.getSpells()
            }.alert(item: $viewModel.errorMessage) { errorMessage in
                Alert(title: errorMessage.title, message: errorMessage.message, dismissButton: errorMessage.dismissButton)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
            }
        }
        .navigationTitle("\(viewModel.dndClass.name) Spells")
    }
}

//struct ClassDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassDetailView(dndClass: <#DnDClass#>)
//    }
//}
