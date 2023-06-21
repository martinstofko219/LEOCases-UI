//
//  MockData.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import Foundation

final class MockData: ObservableObject {
    @Published var cases: [Case] = []
    
    func addCase(_ newCase: Case) {
        cases.append(newCase)
    }
    
    func removeCase(at offsets: IndexSet) {
        cases.remove(atOffsets: offsets)
    }
}
