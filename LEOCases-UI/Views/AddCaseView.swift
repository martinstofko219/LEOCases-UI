//
//  AddCaseView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct AddCaseView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var mockData: MockData
    
    enum FocusedField {
        case caseNumber
    }
    
    @State private var caseNumber: String = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Case number...", text: $caseNumber)
                        .focused($focusedField, equals: .caseNumber)
                        .keyboardType(.numberPad)
                }
                
                Button {
                    let c = Case(id: UUID(), caseNumber: caseNumber, createdOn: Date(), isComplete: false)
                    mockData.add(c)
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
            .onAppear(perform: {
                focusedField = .caseNumber
            })
        }
    }
}

#Preview {
    AddCaseView()
        .preferredColorScheme(.dark)
}
