//
//  ExtraTask.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import Foundation

struct ExtraTask: Hashable, Identifiable {
    let id: UUID
    
    var label: String
    var isComplete: Bool = false
}
