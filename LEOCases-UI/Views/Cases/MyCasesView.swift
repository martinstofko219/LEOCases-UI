//
//  MyCasesView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct MyCasesView: View {
    @EnvironmentObject var mockData: MockData
    
    @State private var showingAddCaseSheet = false
    @State private var showingDeleteAlert = false
    @State private var deleteOffset: IndexSet?
    
    var body: some View {
        NavigationStack {
            ZStack {
//                List($mockData.cases, editActions: .delete) { $c in
//                    NavigationLink(destination: CaseDetailView(caseDetail: $c)) {
//                        CaseListCell(caseNumber: c.caseNumber, createdDate: c.createdOn, isComplete: c.isComplete, pendingCount: c.pendingCount)
//                    }
//                }
                
                List {
                    ForEach($mockData.cases) { $c in
                        NavigationLink(destination: CaseDetailView(caseDetail: $c)) {
                            CaseListCell(caseNumber: c.caseNumber, createdDate: c.createdOn, isComplete: c.isComplete, pendingCount: c.pendingCount)
                        }
                    }
                    .onDelete { indexSet in
                        deleteOffset = indexSet
                        showingDeleteAlert = true
                    }
                }
                
                if mockData.cases.isEmpty {
                    EmptyStateView(imageSymbol: "tray", label: "No cases?\nEnjoy your free time!")
                }
            }
            .navigationTitle("My Cases")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Case") {
                        showingAddCaseSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddCaseSheet) {
                AddCaseView()
            }
            .confirmationDialog("Are you sure you want to delete this case?", isPresented: $showingDeleteAlert, titleVisibility: .visible, actions: {
                Button("Delete Case", role: .destructive) {
                    guard let offset = deleteOffset else {
                        return
                    }
                    
                    if !offset.isEmpty {
                        withAnimation {
                            mockData.removeCase(at: offset)
                        }
                        deleteOffset = nil
                    }
                }
            })
        }
    }
}

#Preview {
    MyCasesView()
        .preferredColorScheme(.dark)
}
