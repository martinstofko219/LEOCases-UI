//
//  ToDoListCell.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct ToDoListCell: View {
    @Binding var label: String
    @Binding var isComplete: Bool
    
    var allowEditing: Bool
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            if (allowEditing && isEditing) {
                TextField("Enter new label...", text: $label)
                    .submitLabel(.done)
            } else {
                Text(label)
                    .font(.body)
                    .onTapGesture {
                        isEditing.toggle()
                    }
            }
            
            Spacer()
            
            Image(systemName: isComplete ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(.blue)
                .onTapGesture {
                    isComplete.toggle()
                }
        }
    }
}

#Preview {
    ToDoListCell(label: .constant("ToDo Label..."), isComplete: .constant(false), allowEditing: false)
        .preferredColorScheme(.dark)
        .scaledToFit()
}
