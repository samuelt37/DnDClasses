//
//  ClassDetailRow.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/6/22.
//

import SwiftUI

struct ClassDetailRow: View {
    let spellName: String
    let spellDesc: [String]
    
    var body: some View {
        VStack {
            Text(spellName).bold().font(.system(size: 24))
            Text(spellDesc.joined(separator: "\n"))
        }
        
    }
}

struct ClassDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        ClassDetailRow(spellName: "world", spellDesc: ["hello"])
    }
}
