//
//  CaseDetailView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct CaseDetailView: View {
    @Binding var caseDetail: Case
    
    @State private var searchWarrantLabel: String = ""
    @State private var extraTaskLabel: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    List {
                        ToDoListCell(label: .constant("Shared with Prosecutor"), isComplete: $caseDetail.sharedWithProsecutor, allowEditing: false)
                    }
                }
                
                Section("SEARCH WARRANTS") {
                    List{
                        ForEach($caseDetail.searchWarrants) { $warrant in
                            ToDoListCell(label: $warrant.label, isComplete: $warrant.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            caseDetail.searchWarrants.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $searchWarrantLabel, placeholder: "Add Search Warrant...")
                            .onSubmit {
                                caseDetail.searchWarrants.append(SearchWarrant(id: UUID(), label: searchWarrantLabel))
                                searchWarrantLabel = ""
                            }
                    }
                }
                
                Section("EXTRA TASKS") {
                    List{
                        ForEach($caseDetail.extraTasks) { $task in
                            ToDoListCell(label: $task.label, isComplete: $task.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            caseDetail.extraTasks.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $extraTaskLabel, placeholder: "Add Extra Task...")
                            .onSubmit {
                                caseDetail.extraTasks.append(ExtraTask(id: UUID(), label: extraTaskLabel))
                                extraTaskLabel = ""
                            }
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
