//
//  AddCaseView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct AddCaseView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var caseNumber: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Case number...", text: $caseNumber)
                        .keyboardType(.numberPad)
                }
                
                Button {
                    print("Add Case tapped")
                    dismiss()
                } label: {
                    Text("Add Case")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.accentColor)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Add Case")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddCaseView()
        .preferredColorScheme(.dark)
}
