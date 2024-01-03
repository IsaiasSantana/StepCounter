//
//  StepCounterApp.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import SwiftUI

@main
struct StepCounterApp: App {
    private let stepManager: StepCounterManager = StepCounterManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environment(stepManager)
    }
}
