//
//  TabItemPreferenceKey.swift
//  teslaApp
//
//  Created by Vermut xxx on 20.05.2024.
//

import SwiftUI

/// Хранение TabItem
struct TabItemPreferenceKey: PreferenceKey {
    // MARK: - Public property

    static var defaultValue: [TabItem] = []

    // MARK: - Public Methods

    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}
