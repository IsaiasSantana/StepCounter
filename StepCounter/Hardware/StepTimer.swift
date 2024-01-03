//
//  StepTimer.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import Foundation
import Observation
import Combine

@Observable
final class StepTimer {
    private var anyCancellables: Set<AnyCancellable> = []
    
    var elapsedTime: Int = 0
    
    func startTimer() {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.elapsedTime += 1
            }.store(in: &anyCancellables)
    }
    
    func resetTimer() {
        elapsedTime = 0
        stopTimer()
    }
    
    func stopTimer() {
        anyCancellables.forEach { $0.cancel() }
        anyCancellables.removeAll()
    }
}
