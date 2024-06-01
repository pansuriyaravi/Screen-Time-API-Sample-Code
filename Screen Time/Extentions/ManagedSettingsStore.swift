//
//  ManagedSettingsStore.swift
//  Screen Time
//
//  Created on 29/05/24.
//  
//

import Foundation
import FamilyControls
import ManagedSettings

extension ManagedSettingsStore {
    static var shared = ManagedSettingsStore()
    
    func shield(familyActivitySelection: FamilyActivitySelection) {
        // Clear to reset previous settings
        clearAllSettings()
        
        let applicationTokens = familyActivitySelection.applicationTokens
        let categoryTokens = familyActivitySelection.categoryTokens
            
        shield.applications = applicationTokens.isEmpty ? nil : applicationTokens
        shield.applicationCategories = categoryTokens.isEmpty ? nil : .specific(categoryTokens)
        shield.webDomainCategories = categoryTokens.isEmpty ? nil : .specific(categoryTokens)
    }
}
