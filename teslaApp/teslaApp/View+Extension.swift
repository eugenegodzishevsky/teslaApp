//
//  View+Extension.swift
//  teslaApp
//
//  Created by Vermut xxx on 15.05.2024.
//

import SwiftUI

/// Расширение вью
extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }

    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }

    func neumorphismUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }

    func neumorphismCircleButtonUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismCircleButtonUnSelectedCircle())
    }

    func backgroundStackView<Content: View>(isLock: Bool = true, content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(
                    isLock ?
                        LinearGradient(
                            colors: [.lightShadow, .black],
                            startPoint: .top,
                            endPoint: .init(x: 0.5, y: 0.4)
                        ) :
                        LinearGradient(
                            colors: [.backgroundLight],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }

    func myTabItem(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifier(tabBarItem: label()))
    }
}

/// Стиль нейморфизм выбранный
struct NeumorphismSelected: ViewModifier {

    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow, radius: 5, x: -5, y: -5)
    }
}

/// Стиль нейморфизм не выбранный
struct NeumorphismUnSelected: ViewModifier {

    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: -5, y: -5)
            .shadow(color: .darkShadow, radius: 5, x: 5, y: 5)
    }
}

/// Стиль нейморфизм не выбранный круг
struct NeumorphismUnSelectedCircle: ViewModifier {
    // MARK: - Private Constants

    private enum Constants {
        static let backgroundColorString = "backgroundLight"
    }

    // MARK: - Public property

    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(
                Circle()
                    .fill(Color(Constants.backgroundColorString))
            )
            .neumorphismUnSelectedStyle()
    }
}

/// Стиль нейморфизм круглая кнопка
struct NeumorphismCircleButtonUnSelectedCircle: ViewModifier {
    // MARK: - Public property

    func body(content: Content) -> some View {
        content
            .frame(width: 20, height: 20)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(LinearGradient(
                        colors: [.lightShadow, .darkShadow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            )
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.darkShadow, .lightShadow.opacity(0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
            .neumorphismUnSelectedStyle()
    }
}

