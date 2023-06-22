//
//  CourtOrder.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import Foundation

struct CourtOrder: Hashable, Identifiable {
    let id: UUID
    
    var label: String
    var isComplete: Bool = false
}
