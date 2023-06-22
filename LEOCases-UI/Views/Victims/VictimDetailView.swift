//
//  VictimDetailView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import SwiftUI

struct VictimDetailView: View {
    @Binding var victim: Victim
    
    var body: some View {
        Text("Victim Detail View")
    }
}

#Preview {
    VictimDetailView(victim: .constant(Victim(id: UUID(), name: "Target")))
        .preferredColorScheme(.dark)
}
