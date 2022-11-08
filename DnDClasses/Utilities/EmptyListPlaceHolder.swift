//
//  EmptyList.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/7/22.
//

import SwiftUI

extension List {
    func emptyListPlaceholder(items: [Any], placeholder: AnyView) -> some View {
        modifier(EmptyListModifier(items: items, placeholder: placeholder))
    }
}

struct EmptyListModifier<Placeholder: View>: ViewModifier {

    let items: [Any]
    let placeholder: Placeholder

    @ViewBuilder
    func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}

struct ListPlaceholderView: View {
    let placeholder: String
    
    var body: some View {
        VStack {
            Text(placeholder).font(.title)
        }
    }
}

struct ListPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlaceholderView(placeholder: "No Data.")
    }
}

