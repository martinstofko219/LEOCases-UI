//
//  CaseDetailView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct CaseDetailView: View {
    @Binding var caseDetail: Case
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    List {
                        ToDoListCell(label: .constant("Shared with Prosecutor"), isComplete: $caseDetail.sharedWithProsecutor, allowEditing: false)
                    }
                }
            }
            .navigationTitle(caseDetail.caseNumber)
        }
    }
}

#Preview {
    CaseDetailView(caseDetail: .constant(Case(id: UUID(), caseNumber: "2029384783493", createdOn: Date())))
        .preferredColorScheme(.dark)
}
