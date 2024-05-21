//
//  TabItemModifier.swift
//  teslaApp
//
//  Created by Vermut xxx on 20.05.2024.
//

import SwiftUI

/// Модификатор для добавления вкладок в таббар
struct TabItemModifier: ViewModifier {
    // MARK: - Public property

    let tabBarItem: TabItem

    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenceKey.self, value: [tabBarItem])
    }
}
