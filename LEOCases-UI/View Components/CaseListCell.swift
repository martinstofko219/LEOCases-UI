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
    var pendingCount: Int
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()
    
    var body: some View {
        HStack {
            Image(systemName: "folder.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(isComplete ? .green : .blue)
        
            VStack(alignment: .leading) {
                Text(caseNumber)
                    .font(.body).bold()
                
                Text("Created on \(dateFormatter.string(from: createdDate))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(isComplete ? "Complete" : "\(pendingCount) \(pendingCount > 1 ? "items" : "item") pending")
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
    CaseListCell(caseNumber: "20294750087", createdDate: Date(), isComplete: false, pendingCount: 3)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
