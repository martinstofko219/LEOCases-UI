//
//  AddVictimView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct AddVictimView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var caseDetail: Case
    
    enum FocusedField {
        case victimName
    }
    
    @State private var victimName: String = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Victim name...", text: $victimName)
                        .focused($focusedField, equals: .victimName)
                }
                
                Button {
                    let v = Victim(id: UUID(), name: victimName)
                    caseDetail.victims.append(v)
                    dismiss()
                } label: {
                    Text("Add Victim")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.accentColor)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Add Victim")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onAppear(perform: {
                focusedField = .victimName
            })
        }
    }
}

#Preview {
    AddVictimView(caseDetail: .constant(Case(id: UUID(), caseNumber: "1234", createdOn: Date())))
}
