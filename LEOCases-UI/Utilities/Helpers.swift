//
//  Helpers.swift
//  LEOCases-UI
//
//  Created by Martin Stofko on 6/20/23.
//

import Foundation

class Helpers {
    func formatDate(value: Date) -> String {
        let df = DateFormatter()
        
        df.dateStyle = .medium
        
        return df.string(from: value)
    }
}
