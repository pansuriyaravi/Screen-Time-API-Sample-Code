//
//  ShieldViewModel.swift
//  Screen Time
//
//  Created on 29/05/24.
//
//

import Foundation
import FamilyControls
import ManagedSettings
import os.log

private let logger = Logger(subsystemName: "ShieldViewModel", category: "ViewModel")

class ShieldViewModel: ObservableObject {
    @Published var familyActivitySelection = FamilyActivitySelection()
    
    private let store = ManagedSettingsStore.shared
    
    func shieldActivities() {
        store.shield(familyActivitySelection: familyActivitySelection)
    }
    
    func requestAuthorization() async {
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
        } catch {
            logger.error("Failed to get authorization: \(error)")
        }
    }
}

