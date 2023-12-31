//
//  CaseDetailView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import SwiftUI

struct CaseDetailView: View {
    @Binding var caseDetail: Case
    
    @State private var showingAddVictimSheet = false
    @State private var newCourtOrderLabel: String = ""
    @State private var newSearchWarrantLabel: String = ""
    @State private var newExtraTaskLabel: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                CompletionIndicatorView(completedItems: caseDetail.completedCount, totalItems: caseDetail.totalCount)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                
                Section {
                    List {
                        ToDoListCell(label: .constant("Shared with Prosecutor"), isComplete: $caseDetail.sharedWithProsecutor, allowEditing: false)
                    }
                }
                
                Section("COURT ORDERS") {
                    List{
                        ForEach($caseDetail.courtOrders) { $courtOrder in
                            ToDoListCell(label: $courtOrder.label, isComplete: $courtOrder.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            caseDetail.courtOrders.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newCourtOrderLabel, placeholder: "Add Court Order...")
                            .onSubmit {
                                if !newCourtOrderLabel.isEmpty {
                                    caseDetail.courtOrders.append(CourtOrder(id: UUID(), label: newCourtOrderLabel))
                                    newCourtOrderLabel = ""
                                }
                            }
                    }
                }
                
                Section("SEARCH WARRANTS") {
                    List {
                        ForEach($caseDetail.searchWarrants) { $warrant in
                            ToDoListCell(label: $warrant.label, isComplete: $warrant.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            caseDetail.searchWarrants.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newSearchWarrantLabel, placeholder: "Add Search Warrant...")
                            .onSubmit {
                                if !newSearchWarrantLabel.isEmpty {
                                    caseDetail.searchWarrants.append(SearchWarrant(id: UUID(), label: newSearchWarrantLabel))
                                    newSearchWarrantLabel = ""
                                }
                            }
                    }
                }
                
                Section("EXTRA TASKS") {
                    List {
                        ForEach($caseDetail.extraTasks) { $task in
                            ToDoListCell(label: $task.label, isComplete: $task.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            caseDetail.extraTasks.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newExtraTaskLabel, placeholder: "Add Extra Task...")
                            .onSubmit {
                                if !newExtraTaskLabel.isEmpty {
                                    caseDetail.extraTasks.append(ExtraTask(id: UUID(), label: newExtraTaskLabel))
                                    newExtraTaskLabel = ""
                                }
                            }
                    }
                }
                
                Section("VICTIMS") {
                    List($caseDetail.victims, editActions: .delete) { $victim in
                        NavigationLink(destination: VictimDetailView(victim: $victim)) {
                            VictimListCell(name: victim.name, pendingCount: victim.pendingCount, isComplete: victim.isComplete)
                        }
                    }
                    
                    Button("Add Victim") {
                        showingAddVictimSheet.toggle()
                    }
                }
            }
            .navigationTitle(caseDetail.caseNumber)
            .listSectionSpacing(.compact)
            .sheet(isPresented: $showingAddVictimSheet) {
                AddVictimView(caseDetail: $caseDetail)
            }
        }
    }
}

#Preview {
    CaseDetailView(caseDetail: .constant(Case(id: UUID(), caseNumber: "2029384783493", createdOn: Date())))
        .preferredColorScheme(.dark)
}
