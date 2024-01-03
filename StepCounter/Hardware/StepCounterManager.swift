//
//  StepCounterManager.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import Foundation
import CoreMotion
import Observation

@Observable
final class StepCounterManager {
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    private let operationQueue = OperationQueue()
    
    var steps = 0
    
    func start() {
        guard CMMotionActivityManager.isActivityAvailable() else {
            return
        }
        
        activityManager.startActivityUpdates(to: operationQueue) { _ in }
        
        guard CMPedometer.isStepCountingAvailable() else {
            return
        }
        pedometer.startUpdates(from: Date()) { [weak self] (data, _) in
            self?.handlePedometerData(data)
        }
    }
    
    func reset() {
        stop()
        steps = 0
    }

    func stop() {
        activityManager.stopActivityUpdates()
        pedometer.stopUpdates()
    }
    
    private func handlePedometerData(_ data: CMPedometerData?) {
        guard let data else {
            return
        }
        
        steps = Int(truncating: data.numberOfSteps)
    }
}
