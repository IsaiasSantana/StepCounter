//
//  ProgressView.swift
//  StepCounter
//
//  Created by Isaías Santana on 03/01/24.
//

import Foundation
import SwiftUI

struct ProgressView: View {
    private let progress: CGFloat

    init(progress: CGFloat) {
        self.progress = progress
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .foregroundStyle(Color(.systemGray5))
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.radians(-.pi / 2))
                .foregroundStyle(Color(.systemBlue))
                .animation(.linear, value: progress)
        }
    }
}

#Preview {
    ProgressView(progress: 0.3)
}
