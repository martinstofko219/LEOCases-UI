//
//  CaseListCellView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct CaseListCell: View {
    var caseNumber: String
    var createdDate: Date
    var isComplete: Bool
    
    func formatDate(value: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        
        return df.string(from: value)
    }
    
    var body: some View {
        HStack {
            Image(systemName: "folder.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(isComplete ? .green : .blue)
        
            VStack(alignment: .leading) {
                Text(caseNumber)
                    .font(.body).bold()
                
                Text("Created on \(formatDate(value: createdDate))")
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
    CaseListCell(caseNumber: "20294750087", createdDate: Date(), isComplete: true)
        .preferredColorScheme(.dark)
        .scaledToFit()
}
