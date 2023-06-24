//
//  VictimCellView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct VictimListCell: View {
    var name: String
    var pendingCount: Int
    var isComplete: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "storefront.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(isComplete ? Color("PoliceGreen") : Color("PoliceBlue"))
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.body).bold()
                
                Text(isComplete ? "Complete" : "\(pendingCount) \(pendingCount > 1 ? "items" : "item") pending")
                    .font(.subheadline)
                    .foregroundStyle(isComplete ? Color("PoliceGreen") : .secondary)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
    }
}

#Preview {
    VictimListCell(name: "Target", pendingCount: 3, isComplete: false)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
