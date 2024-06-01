//
//  Logger.swift
//  Screen Time
//
//  Created on 29/05/24.
//  
//

import Foundation
import os.log

extension Logger {
    init(subsystemName: String, category: String) {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("Unable to retrieve bundle identifier.")
        }
        
        self.init(subsystem: bundleIdentifier + ".\(subsystemName)", category: category)
    }
}

