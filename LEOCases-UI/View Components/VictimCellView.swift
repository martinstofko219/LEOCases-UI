//
//  VictimCellView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct VictimCellView: View {
    var name: String
    var pendingCount: Int
    var isComplete: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "storefront.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(isComplete ? .green : .blue)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.body).bold()
                
                Text(isComplete ? "Complete" : "\(pendingCount) items pending")
                    .font(.subheadline)
                    .foregroundStyle(isComplete ? .green : .secondary)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
    }
}

#Preview {
    VictimCellView(name: "Target", pendingCount: 3, isComplete: false)
        .preferredColorScheme(.dark)
        .scaledToFit()
}
