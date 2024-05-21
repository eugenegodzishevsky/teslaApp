//
//  ClimateViewModel.swift
//  teslaApp
//
//  Created by Vermut xxx on 17.05.2024.
//

import SwiftUI

/// Вью модель экрана климата
final class ClimateViewModel: ObservableObject {
    // MARK: - Public properties

    @Published var isOnClimate = false
    @Published var isAlertShown = false
    @Published var isSliderOn = false
    @Published var revealDetails = true
    @Published var minCelsius: CGFloat = 15
    @Published var maxCelsius: CGFloat = 30
    @Published var currentCelsius = 15 {
        didSet {
            updateSliderOffset()
        }
    }
    
    @Published var circleProgress: CGFloat = 0.0
    @Published var selectedColor: Color = .topGradient
    
    @Published var acSliderOffset: CGFloat = -85.0


    // MARK: - Private property

    private let sliderStep: CGFloat = 1
    private let sliderMaxValue: CGFloat = 15
    private let sliderWidth: CGFloat = 200

    // MARK: - Public methods

    func getCircleGradus() {
        circleProgress = 1.0 - ((maxCelsius - CGFloat(currentCelsius)) / minCelsius)
    }

    func makeMinimumValueText(sliderOffset: CGFloat) {
        currentCelsius = Int((sliderOffset + 100) / sliderPxPerStep()) + Int(minCelsius)
        getCircleGradus()
    }

    func increaseValue() {
        guard currentCelsius < Int(maxCelsius) else { return }
        currentCelsius += 1
    }

    func decreaseValue() {
        guard currentCelsius > Int(minCelsius) else { return }
        currentCelsius -= 1
    }

    func sliderMove(value: DragGesture.Value) -> CGFloat {
        isSliderOn = true
        let stepConut = floorf(Float(value.location.x / sliderPxPerStep()))
        makeMinimumValueText(sliderOffset: CGFloat(stepConut) * sliderPxPerStep())
        return CGFloat(stepConut) * sliderPxPerStep()
    }

    // MARK: - Private methods

    private func sliderPxPerStep() -> CGFloat {
        sliderStep * (sliderWidth / sliderMaxValue)
    }
    
    private func updateSliderOffset() {
            let relativeOffset = (CGFloat(currentCelsius) - minCelsius) / (maxCelsius - minCelsius)
            acSliderOffset = (relativeOffset * sliderWidth) - (sliderWidth / 2)
        }
}
