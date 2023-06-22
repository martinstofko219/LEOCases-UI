//
//  Case.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/21/23.
//

import Foundation

struct Case: Hashable, Identifiable {
    let id: UUID
    let caseNumber: String
    let createdOn: Date
    
    var isComplete: Bool = false
    var sharedWithProsecutor: Bool = false
    var searchWarrants: [SearchWarrant] = []
    var extraTasks: [ExtraTask] = []
}
