//
//  ClassListRow.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/5/22.
//

import SwiftUI

struct ClassListRow: View {
    let dndClass: String
    
    var body: some View {
        Text(dndClass)
    }
}

struct ClassListRow_Previews: PreviewProvider {
    static var previews: some View {
        ClassListRow(dndClass: "")
    }
}
