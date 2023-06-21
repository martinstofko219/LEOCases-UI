//
//  MyCasesView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct MyCasesView: View {
    @State var showingAddCaseSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                CaseListCell(caseNumber: "20294750087", createdDate: Date(), isComplete: false)
                CaseListCell(caseNumber: "20280094875", createdDate: Date(), isComplete: true)
                CaseListCell(caseNumber: "20285011875", createdDate: Date(), isComplete: false)
            }
            .navigationTitle("My Cases")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Case") {
                        print("Add Case tapped")
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
