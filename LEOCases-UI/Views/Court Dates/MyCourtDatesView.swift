//
//  MyCourtDatesView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct MyCourtDatesView: View {
    @EnvironmentObject var mockData: MockData
    
    @State private var showDatePicker = false
    @State private var newCourtDate = Date()
    @State private var datePickerCaseNumber = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                List($mockData.cases) { $c in
                    CourtDateListCell(caseNumber: c.caseNumber, isComplete: c.isComplete, courtDate: c.courtDate)
                        .onTapGesture {
                            newCourtDate = c.courtDate ?? Date()
                            datePickerCaseNumber = c.caseNumber
                            showDatePicker.toggle()
                        }
                    
                    if showDatePicker && c.caseNumber == datePickerCaseNumber {
                        VStack {
                            DatePicker("", selection: $newCourtDate)
                                .datePickerStyle(.graphical)
                            
                            HStack {
                                Button("Clear Date") {
                                    c.courtDate = nil
                                    showDatePicker.toggle()
                                }
                                .foregroundStyle(.red)
                                
                                Spacer()
                                
                                Button("Set Court Date") {
                                    c.courtDate = newCourtDate
                                    showDatePicker.toggle()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                    }
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
