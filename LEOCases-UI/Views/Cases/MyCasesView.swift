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
    
    var body: some View {
        NavigationStack {
            ZStack {
                List($mockData.cases, editActions: .delete) { $c in
                    NavigationLink(destination: CaseDetailView(caseDetail: $c)) {
                        CaseListCell(caseNumber: c.caseNumber, createdDate: c.createdOn, isComplete: c.isComplete, pendingCount: c.pendingCount)
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
        }
    }
}

#Preview {
    MyCasesView()
        .preferredColorScheme(.dark)
}
