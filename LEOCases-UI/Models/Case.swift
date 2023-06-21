//
//  Case.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import Foundation

struct Case: Identifiable {
    let id: UUID
    let caseNumber: String
    let createdOn: Date
    let isComplete: Bool
}
