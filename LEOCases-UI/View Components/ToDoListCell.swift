//
//  ToDoListCell.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct ToDoListCell: View {
    @State var label: String
    @State var isComplete: Bool
    
    var body: some View {
        HStack {
            Text(label)
                .font(.body)
            
            Spacer()
            
            Image(systemName: isComplete ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(.blue)
                .onTapGesture {
                    isComplete.toggle()
                }
            
        }
        .padding()
    }
}

#Preview {
    ToDoListCell(label: "ToDo Label...", isComplete: false)
        .preferredColorScheme(.dark)
        .scaledToFit()
}
