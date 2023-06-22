//
//  Victim.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/22/23.
//

import Foundation

struct Victim: Hashable, Identifiable {
    let id: UUID
    
    var name: String
    var evidenceCom: Bool = false
    var subpeonas: [Subpeona] = []
    var courtOrders: [CourtOrder] = []
    var cameraFootage: [CameraFootage] = []
    var extraTasks: [ExtraTask] = []
    
    var pendingCount: Int {
        var count = 0
        if !evidenceCom {
            count+=1
        }
        
        count += subpeonas.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        count += courtOrders.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        count += cameraFootage.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        count += extraTasks.reduce(0) { $0 + ($1.isComplete ? 0 : 1) }
        
        return count
    }
    
    var isComplete: Bool {
        return pendingCount == 0
    }
}
