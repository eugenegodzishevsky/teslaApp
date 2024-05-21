//
//  teslaAppApp.swift
//  teslaApp
//
//  Created by Vermut xxx on 14.05.2024.
//

import SwiftUI

@main
struct teslaAppApp: App {
    var body: some Scene {
        WindowGroup {
            TeslaLogoView()
                .environment(\.colorScheme, .dark)
        }
    }
}
