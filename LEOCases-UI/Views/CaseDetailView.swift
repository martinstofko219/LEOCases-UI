//
//  CaseDetailView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct CaseDetailView: View {
    var caseDetail: Case
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    List {
                        ToDoListCell(label: "Shared with Prosecutor", isComplete: caseDetail.sharedWithProsecutor, allowEditing: false)
                    }
                }
            }
            .navigationTitle(caseDetail.caseNumber)
        }
    }
}

#Preview {
    CaseDetailView(caseDetail: Case(id: UUID(), caseNumber: "2029384783493", createdOn: Date()))
        .preferredColorScheme(.dark)
}
