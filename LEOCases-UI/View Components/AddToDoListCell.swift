//
//  AddToDoListCell.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct AddToDoListCell: View {
    @Binding var label: String
    
    var placeholder: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $label)
                .submitLabel(.done)
            
            Spacer()
            
            Image(systemName: "circle.dotted")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    AddToDoListCell(label: .constant(""), placeholder: "Add Item...")
        .preferredColorScheme(.dark)
        .scaledToFit()
}
