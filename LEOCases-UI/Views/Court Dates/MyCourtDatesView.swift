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
            }.navigationTitle("My Court Dates")
        }
    }
}

#Preview {
    MyCourtDatesView()
        .preferredColorScheme(.dark)
}
