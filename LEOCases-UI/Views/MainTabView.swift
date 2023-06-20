//
//  MainTabView.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MyCasesView()
                .tabItem { Label("My Cases", systemImage: "tray.full.fill") }
            MyCourtDatesView()
                .tabItem { Label("My Court Dates", systemImage: "building.columns.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    MainTabView()
        .preferredColorScheme(.dark)
}
