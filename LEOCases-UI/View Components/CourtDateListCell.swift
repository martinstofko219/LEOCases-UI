//
//  CourtDateListCell.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct CourtDateListCell: View {
    var caseNumber: String
    var isComplete: Bool
    var courtDate: Date?
    
    private func iconColor() -> Color {
        var color = Color.secondary
        
        if courtDate != nil {
            color = isComplete ? Color("PoliceGreen") : Color("PoliceBlue")
        }
        
        return  color
    }
    
    private func formatDate(value: Date?) -> String {
        var dateString = "Tap to Set Court Date"
        
        guard let courtDate = value else { return dateString }
        
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        dateString = df.string(from: courtDate)
        
        return dateString
    }
    
    var body: some View {
        HStack {
            Image(systemName: "calendar.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(iconColor())
            
            VStack(alignment: .leading) {
                Text(formatDate(value: courtDate))
                    .font(.body).bold()
                
                Text("Case: " + caseNumber)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    CourtDateListCell(caseNumber: "29293484932", isComplete: false)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
