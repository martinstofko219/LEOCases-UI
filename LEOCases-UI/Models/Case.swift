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
    
    var sharedWithProsecutor: Bool = false
    var courtOrders: [CourtOrder] = []
    var searchWarrants: [SearchWarrant] = []
    var extraTasks: [ExtraTask] = []
    var victims: [Victim] = []
    
    var pendingCount: Int {
        var count = 0
        if !sharedWithProsecutor {
            count+=1
        }
        
        count += courtOrders.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        count += searchWarrants.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        count += extraTasks.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        count += victims.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        
        return count
    }
    
    var isComplete: Bool {
        return pendingCount == 0
    }
}
