//
//  EmptyStateView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/23/23.
//

import SwiftUI

struct EmptyStateView: View {
    let imageSymbol: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: imageSymbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
                .foregroundStyle(.tertiary)
            
            Text(label)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundStyle(.tertiary)
                .padding()
        }
    }
}

#Preview {
    EmptyStateView(imageSymbol: "tray", label: "No cases?\nEnjoy your free time!")
        .preferredColorScheme(.dark)
}
