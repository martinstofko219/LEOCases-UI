//
//  MyCourtDatesView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct MyCourtDatesView: View {
    @EnvironmentObject var mockData: MockData
    
    var body: some View {
        NavigationStack {
            ZStack{
                List($mockData.cases) { $c in
                    CourtDateListCell(caseNumber: c.caseNumber, isComplete: c.isComplete, courtDate: c.courtDate)
                }
                
                if mockData.cases.isEmpty {
                    EmptyStateView(imageSymbol: "building.columns", label: "Add a Case to be able to create a court date")
                }
            }.navigationTitle("My Court Dates")
        }
    }
}

#Preview {
    MyCourtDatesView()
        .preferredColorScheme(.dark)
}
