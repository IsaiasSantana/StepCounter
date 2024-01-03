//
//  ContentActivityView.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import Foundation
import SwiftUI

struct ContentActivityView: View {
    private let totalSteps: Int
    private let elapsedTime: Int
    private let progress: CGFloat
    
    init(totalSteps: Int, elapsedTime: Int, progress: CGFloat) {
        self.totalSteps = totalSteps
        self.elapsedTime = elapsedTime
        self.progress = progress
    }
    
    var body: some View {
        ZStack {
            ProgressView(progress: progress)
            ActivityView(currentDate: Date.now,
                         elapsedTime: .seconds(elapsedTime),
                         totalSteps: totalSteps)
        }
    }
}

#Preview {
    ContentActivityView(totalSteps: 10000, elapsedTime: 1, progress: 1 / 10000)
}
