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
    var isComplete: Bool = false
    var evidenceCom: Bool = false
    var subpeonas: [Subpeona] = []
    var courtOrders: [CourtOrder] = []
    var cameraFootage: [CameraFootage] = []
    var extraTasks: [ExtraTask] = []
}
