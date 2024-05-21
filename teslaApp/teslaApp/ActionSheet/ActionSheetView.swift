//
//  ActionSheetView.swift
//  teslaApp
//
//  Created by Vermut xxx on 17.05.2024.
//

import SwiftUI

/// Кастомный BottomSheet
struct ActionSheetView: View {
    // MARK: - Private Constants

    private enum Constants {
        static let dotOffsetNumber: CGFloat = 85
        static let sliderLightOffsetNumber: CGFloat = -55
        static let titleText = "A/C is ON"
        static let descriptionText = "Tap to turn off or swipe up for a fast setup"
        static let emptyString = ""
        static let celsiusString = "º"
        static let carDoorImageName = "carDoor"
        static let onString = "On"
        static let ventString = "Vent"
        static let backImageName = "backChevron"
        static let nextImageName = "nextChevron"
        static let powerImageName = "power"
    }

    // MARK: - Public properties

    var body: some View {
        VStack {
            Capsule()
                .fill(.black)
                .frame(width: 80, height: 3)
                .padding(.top)
            HStack(spacing: 60) {
                titleTextView
                onButtonView
            }
            .padding(.bottom, 20)
            HStack(spacing: 30) {
                ColorPicker(Constants.emptyString, selection: $climateViewModel.selectedColor)
                Spacer()
                decreaseButtonView
                celsiusTextView
                increaseButtonView
                Spacer()
                Image(Constants.carDoorImageName)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            bottomTextView
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        .background(
            .ultraThinMaterial, in:
            RoundedRectangle(cornerRadius: 40)
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .offset(y: UIScreen.main.bounds.height / 2 + 120)
        .offset(y: actionSheetViewModel.currentMenuOffsetY)
        .gesture(dragGesture)
    }

    // MARK: - Private properties

    @EnvironmentObject private var climateViewModel: ClimateViewModel

    @StateObject private var actionSheetViewModel = ActionSheetViewModel()

    @GestureState private var gestureOffset = CGSize.zero

    private var titleTextView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(Constants.titleText)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)

            Text(Constants.descriptionText)
                .lineLimit(2)
                .frame(width: 200, alignment: .leading)
                .foregroundColor(.gray)
        }
        .padding(.leading)
    }

    private var bottomTextView: some View {
        HStack {
            Text(Constants.onString)
            Spacer()
            Text(Constants.ventString)
        }
        .padding(.horizontal, 40)
    }

    private var celsiusTextView: some View {
        Text("\(climateViewModel.currentCelsius)\(Constants.celsiusString)")
            .font(.system(size: 30, weight: .medium, design: .default))
            .frame(width: 50)
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, _ in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { _ in
                withAnimation {
                    actionSheetViewModel.getYOffset()
                }
            }
    }

    private var onButtonView: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [.topGradient, .blue.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(height: 70)
                .neumorphismUnSelectedStyle()
            Button {
                climateViewModel.isOnClimate.toggle()
            } label: {
                Image(Constants.powerImageName)
                    .foregroundColor(.white)
                    .frame(width: 63, height: 63)
                    .background(
                        Circle()
                            .fill(buttonGradient)
                    )
            }
        }
    }

    private var decreaseButtonView: some View {
        Button {
            climateViewModel.decreaseValue()
            climateViewModel.getCircleGradus()
        } label: {
            Image(Constants.backImageName)
        }
    }

    private var increaseButtonView: some View {
        Button {
            climateViewModel.increaseValue()
            climateViewModel.getCircleGradus()
        } label: {
            Image(Constants.nextImageName)
        }
    }

    private var buttonGradient: LinearGradient {
        LinearGradient(
            colors: [.topBlue, .topGradient],
            startPoint: .init(x: 0, y: 0.5),
            endPoint: .init(x: 1, y: 1)
        )
    }

    // MARK: - Private methods

    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            actionSheetViewModel.currentMenuOffsetY = gestureOffset.height + actionSheetViewModel.lastMenuOffsetY
        }
    }
}

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
            .environment(\.colorScheme, .dark)
    }
}
