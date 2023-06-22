//
//  VictimDetailView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct VictimDetailView: View {
    @Binding var victim: Victim
    
    @State private var newSubpeonaLabel: String = ""
    @State private var newCourtOrderLabel: String = ""
    @State private var newCameraFootageLabel: String = ""
    @State private var newExtraTaskLabel: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    List {
                        TextField("Victim Name...", text: $victim.name)
                        ToDoListCell(label: .constant("Evidence.com"), isComplete: $victim.evidenceCom, allowEditing: false)
                    }
                }
                
                Section("SUBPEONAS") {
                    List{
                        ForEach($victim.subpeonas) { $subpeona in
                            ToDoListCell(label: $subpeona.label, isComplete: $subpeona.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            victim.subpeonas.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newSubpeonaLabel, placeholder: "Add Subpeona...")
                            .onSubmit {
                                if !newSubpeonaLabel.isEmpty {
                                    victim.subpeonas.append(Subpeona(id: UUID(), label: newSubpeonaLabel))
                                    newSubpeonaLabel = ""
                                }
                            }
                    }
                }
                
                Section("COURT ORDERS") {
                    List{
                        ForEach($victim.courtOrders) { $courtOrder in
                            ToDoListCell(label: $courtOrder.label, isComplete: $courtOrder.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            victim.courtOrders.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newCourtOrderLabel, placeholder: "Add Court Order...")
                            .onSubmit {
                                if !newCourtOrderLabel.isEmpty {
                                    victim.courtOrders.append(CourtOrder(id: UUID(), label: newCourtOrderLabel))
                                    newCourtOrderLabel = ""
                                }
                            }
                    }
                }
                
                Section("CAMERA FOOTAGE") {
                    List{
                        ForEach($victim.cameraFootage) { $camFootage in
                            ToDoListCell(label: $camFootage.label, isComplete: $camFootage.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            victim.cameraFootage.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newCameraFootageLabel, placeholder: "Add Camera Footage...")
                            .onSubmit {
                                if !newCameraFootageLabel.isEmpty {
                                    victim.cameraFootage.append(CameraFootage(id: UUID(), label: newCameraFootageLabel))
                                    newCameraFootageLabel = ""
                                }
                            }
                    }
                }
                
                Section("EXTRA TASKS") {
                    List {
                        ForEach($victim.extraTasks) { $task in
                            ToDoListCell(label: $task.label, isComplete: $task.isComplete, allowEditing: true)
                        }
                        .onDelete(perform: { indexSet in
                            victim.extraTasks.remove(atOffsets: indexSet)
                        })
                        
                        AddToDoListCell(label: $newExtraTaskLabel, placeholder: "Add Extra Task...")
                            .onSubmit {
                                if !newExtraTaskLabel.isEmpty {
                                    victim.extraTasks.append(ExtraTask(id: UUID(), label: newExtraTaskLabel))
                                    newExtraTaskLabel = ""
                                }
                            }
                    }
                }
            }
            .navigationTitle(victim.name)
        }
    }
}

#Preview {
    VictimDetailView(victim: .constant(Victim(id: UUID(), name: "Target")))
        .preferredColorScheme(.dark)
}
