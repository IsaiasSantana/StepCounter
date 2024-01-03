//
//  StepCounterView.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import SwiftUI

struct StepCounterView: View {
    @Environment(StepCounterManager.self) var stepManager
    
    @State private var stepTimer = StepTimer()
    private let totalSteps = 1_0000
    
    private var progress: CGFloat {
        CGFloat(stepManager.steps) / CGFloat(totalSteps)
    }

    var body: some View {
        VStack {
            ContentActivityView(totalSteps: totalSteps,
                                elapsedTime: stepTimer.elapsedTime,
                                progress: progress)
                .padding()
            
            CountStepView(steps: stepManager.steps)
            
            Spacer()
            
            CommandView(start: {
                stepManager.start()
                stepTimer.startTimer()
            }, restart: {
                stepTimer.resetTimer()
                stepManager.reset()
            }, pause: {
                stepTimer.stopTimer()
                stepManager.stop()
            })
        }
    }
}

private struct CountStepView: View {
    private let steps: Int
    
    init(steps: Int) {
        self.steps = steps
    }

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image("fl")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("fr")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.aspectRatio(0.5, contentMode: .fit)
                
            
            Text("Steps: \(steps)")
        }
    }
}

private struct CommandView: View {
    let start: () -> ()
    let restart: () -> ()
    let pause: () -> ()
    
    init(start: @escaping () -> Void, restart: @escaping () -> Void, pause: @escaping () -> Void) {
        self.start = start
        self.restart = restart
        self.pause = pause
    }
    
    var body: some View {
        HStack {
            Button("Restart") {
                restart()
            }.buttonStyle(.borderless)
                .foregroundStyle(.red)
            
            Button("Start") {
                start()
            }.buttonStyle(.borderedProminent)
                
            
            Button("Pause") {
                pause()
            }.foregroundStyle(.orange)
        }
    }
}

#Preview {
    StepCounterView()
}
