//
//  ActivityView.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import Foundation
import SwiftUI

struct ActivityView: View {
    private let currentDate: Date
    private let elapsedTime: Duration
    private let totalSteps: Int
    
    init(currentDate: Date, elapsedTime: Duration, totalSteps: Int) {
        self.currentDate = currentDate
        self.elapsedTime = elapsedTime
        self.totalSteps = totalSteps
    }
    
    var body: some View {
        VStack {
            Text(Date(), style: .date)
            
            TimerView(elapsedTime: elapsedTime)
            
            Text("Goal \(totalSteps)")
        }
    }
}

private struct TimerView: View {
    private let elapsedTime: Duration
    
    init(elapsedTime: Duration) {
        self.elapsedTime = elapsedTime
    }

    var body: some View {
        HStack {
            Image(systemName: "clock")
                .font(.title)
            
            Text(elapsedTime, format: .time(pattern: .minuteSecond))
                .font(.largeTitle)
        }
    }
}

#Preview {
    ActivityView(currentDate: Date.now, elapsedTime: .seconds(0), totalSteps: 1000)
}
