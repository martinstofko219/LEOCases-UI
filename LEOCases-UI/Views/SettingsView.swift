//
//  SettingsView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationDate = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("NOTIFICATIONS") {
                    DatePicker("Notify Me", selection: $notificationDate)
                    
                    Button("Set Notifications") {
                        print("Set Notification tapped")
                    }
                    
                    Button("Clear Notifications") {
                        print("Clear Notifications tapped")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
}
