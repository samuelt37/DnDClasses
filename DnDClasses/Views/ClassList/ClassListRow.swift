//
//  ClassListRow.swift
//  DnDClasses
//
//  Created by Samuel Tse on 11/5/22.
//

import SwiftUI

struct ClassListRow: View {
    let dndClass: DnDClass
    
    var body: some View {
        Text(dndClass.name)
    }
}

//struct ClassListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassListRow(dndClass: <#DnDClass#>)
//    }
//}
