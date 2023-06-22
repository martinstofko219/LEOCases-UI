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
            List($mockData.cases, editActions: .delete) { $c in
                NavigationLink(destination: CaseDetailView(caseDetail: $c)) {
                    CaseListCell(caseNumber: c.caseNumber, createdDate: c.createdOn, isComplete: c.isComplete)
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
            
            //            List {
            //                ForEach($mockData.cases) { $c in
            //                    NavigationLink(destination: CaseDetailView(caseDetail: $c)) {
            //                        CaseListCell(caseNumber: c.caseNumber, createdDate: c.createdOn, isComplete: c.isComplete)
            //                    }
            //                }
            //                .onDelete(perform: { indexSet in
            //                    mockData.removeCase(at: indexSet)
            //                })
            //            }
            //            .navigationTitle("My Cases")
            //            .toolbar {
            //                ToolbarItem(placement: .topBarTrailing) {
            //                    Button("Add Case") {
            //                        print("Add Case tapped")
            //                        showingAddCaseSheet.toggle()
            //                    }
            //                }
            //            }
            //            .sheet(isPresented: $showingAddCaseSheet) {
            //                AddCaseView()
            //            }
        }
    }
}

#Preview {
    MyCasesView()
        .preferredColorScheme(.dark)
}
