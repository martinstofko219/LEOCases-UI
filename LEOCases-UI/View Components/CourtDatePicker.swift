//
//  CourtDatePicker.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/23/23.
//

import SwiftUI

struct CourtDatePicker: View {
    @Binding var caseDetail: Case
    @Binding var showDatePicker: Bool
    @Binding var newCourtDate: Date
    
    var body: some View {
        
    }
}

#Preview {
    CourtDatePicker(caseDetail: .constant(Case(id: UUID(), caseNumber: "1234", createdOn: Date())), showDatePicker: .constant(false), newCourtDate: .constant(Date()))
}
