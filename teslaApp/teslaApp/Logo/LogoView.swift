//
//  LogoView.swift
//  teslaApp
//
//  Created by Vermut xxx on 17.05.2024.
//

import SwiftUI

/// Экран загрузки приложения
struct TeslaLogoView: View {

    @State private var isStartScreenShown = false
    @State private var isTeslaLogoShown = false
    @State private var trimEnd: CGFloat = 0.0

    var body: some View {
        NavigationView {
            backgroundStackView(isLock: false) {
                VStack {
                    ZStack {
                        LogoShape()
                            .trim(from: 0, to: trimEnd)
                            .stroke(Color.lightGray, lineWidth: 3)
                            .shadow(color: .black, radius: 20)
                            .offset(x: 0, y: -100)

                        LogoShape()
                            .fill(isTeslaLogoShown ? .white : .clear)
                            .shadow(color: .black, radius: 20)
                            .offset(x: 0, y: -100)
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.linear(duration: 3)) {
                                isTeslaLogoShown.toggle()
                            }
                            withAnimation(.linear(duration: 3).delay(0.5)) {
                                trimEnd = 1.0
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            isStartScreenShown.toggle()
                        }
                    }
                    navigationLinkView
                    Spacer()
                }
            }
        }
    }


    // MARK: - Public property

    private var navigationLinkView: some View {
        NavigationLink(isActive: $isStartScreenShown) {
            StartView()
        } label: {
            EmptyView()
        }
    }
}
