//
//  LEOCases_UIApp.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import SwiftUI

@main
struct LEOCases_UIApp: App {
    
    var mockData = MockData()
    
    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(mockData)
        }
    }
}
