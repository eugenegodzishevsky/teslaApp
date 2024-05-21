//
//  ClimateSliderView.swift
//  teslaApp
//
//  Created by Vermut xxx on 17.05.2024.
//

import SwiftUI

struct ClimateSliderView: View {
    // MARK: - Private Constants

    private enum Constants {
        static let dotOffsetNumber: CGFloat = 95
        static let sliderLightOffsetNumber: CGFloat = -55
        static let sliderDotImageName = "slide"
    }

    // MARK: - Public property

    var body: some View {
        ZStack {
            lineView
            RoundedRectangle(cornerRadius: 2)
                .fill(climateViewModel.selectedColor)
                .frame(width: climateViewModel.acSliderOffset + Constants.dotOffsetNumber, height: 8)
                .offset(x: Constants.sliderLightOffsetNumber + (climateViewModel.acSliderOffset / 2))
            Image(Constants.sliderDotImageName)
                .offset(x: climateViewModel.acSliderOffset, y: 5)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.location.x <= totalWidth, value.location.x > -85 {
                                climateViewModel.acSliderOffset = climateViewModel.sliderMove(value: value)
                            }
                        }
                )
        }
    }

    // MARK: - Private property

    private let sliderStep: CGFloat = 1
    private let sliderMaxValue: CGFloat = 15
    private let sliderWidth: CGFloat = 200

    @EnvironmentObject private var climateViewModel: ClimateViewModel

    @State private var totalWidth: CGFloat = 115

    private var lineView: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(gradient)
            .frame(width: sliderWidth, height: 8)
    }

    private var gradient: LinearGradient {
        LinearGradient(
            colors: [.black.opacity(0.5), .lightShadow],
            startPoint: .top,
            endPoint: .init(x: 0.5, y: 0.7)
        )
    }
}
