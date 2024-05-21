//
//  ActionSheetViewModel.swift
//  teslaApp
//
//  Created by Vermut xxx on 17.05.2024.
//

import SwiftUI

/// Вью модель ActionSheet
final class ActionSheetViewModel: ObservableObject {

    @Published var currentMenuOffsetY: CGFloat = 0.0
    @Published var lastMenuOffsetY: CGFloat = 0.0

    // MARK: - Public methods

    func getYOffset() {
        let maxHeight = UIScreen.main.bounds.height / 6
        if -currentMenuOffsetY > maxHeight / 2 {
            currentMenuOffsetY = -maxHeight
        } else {
            currentMenuOffsetY = 0
        }
        lastMenuOffsetY = currentMenuOffsetY
    }
}
