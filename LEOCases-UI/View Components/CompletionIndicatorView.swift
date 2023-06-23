//
//  CompletionIndicatorView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/23/23.
//

import SwiftUI

struct CompletionIndicatorView: View {
    var completedItems: Int
    var totalItems: Int
    
    var body: some View {
        ProgressView(value: Float(completedItems), total: Float(totalItems), label: {
            HStack {
                Text("Completed")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text("\(completedItems.formatted(.number)) out of \(totalItems.formatted(.number))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        })
        .tint(.green)
    }
}

#Preview {
    CompletionIndicatorView(completedItems: 4, totalItems: 10)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
