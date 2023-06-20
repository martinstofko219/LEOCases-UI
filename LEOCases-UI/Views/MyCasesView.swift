//
//  MyCasesView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct MyCasesView: View {
    var body: some View {
        NavigationStack {
            List {
                CaseListCellView(caseNumber: "20294750087", createdDate: Date(), isComplete: false)
                CaseListCellView(caseNumber: "20280094875", createdDate: Date(), isComplete: true)
                CaseListCellView(caseNumber: "20285011875", createdDate: Date(), isComplete: false)
            }
            .padding(.top, 30)
            .navigationTitle("My Cases")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Case") {
                        print("Add Case tapped")
                    }
                }
            }
        }
    }
}

#Preview {
    MyCasesView()
        .preferredColorScheme(.dark)
}
