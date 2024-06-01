//
//  ShieldView.swift
//  Screen Time
//
//  Created on 29/05/24.
//
//

import SwiftUI
import os.log

private let logger = Logger(subsystemName: "ShieldView", category: "View")

struct ShieldView: View {
    @EnvironmentObject private var manager: ShieldViewModel
    @State private var showActivityPicker = false
    
    var body: some View {
        ZStack {
            selectButton
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                lockButton
            }
        }
        .familyActivityPicker(
            isPresented: $showActivityPicker,
            selection: $manager.familyActivitySelection
        )
    }
}

// MARK: Views
private extension ShieldView {
    var selectButton: some View {
        Button(action: onPressSelect) {
            Label("Select", systemImage: "gearshape.fill")
        }
    }
    
    var lockButton: some View {
        Button(action: onLock) {
            Image(systemName: "lock.fill")
        }
    }
}

// MARK: Internals
private extension ShieldView {
    func onPressSelect() {
        logger.debug("Configuration button pressed.")
        showActivityPicker = true
    }
    
    func onLock() {
        logger.debug("Apply settings button pressed.")
        manager.shieldActivities()
    }
}

#Preview {
    NavigationStack {
        ShieldView()
    }
    .environmentObject(ShieldViewModel())
}
