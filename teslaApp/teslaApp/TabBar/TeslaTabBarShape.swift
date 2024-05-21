//
//  TeslaTabBarShape.swift
//  teslaApp
//
//  Created by Vermut xxx on 20.05.2024.
//

import SwiftUI

struct TeslaTabBarShape: Shape {
    // MARK: - Public methods

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY - 10))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX + 32, y: rect.midY - 20),
            control: CGPoint(x: rect.midX + 10, y: rect.midY - 8)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX + 100, y: rect.midY - 40),
            control: CGPoint(x: rect.midX + 50, y: rect.midY - 40)
        )
        path.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.midY - 40))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY - 10),
            control: CGPoint(x: rect.maxX - 20, y: rect.midY - 40)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - 40, y: rect.midY + 40),
            control: CGPoint(x: rect.maxX, y: rect.midY + 40)
        )
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + 40))
        path.addLine(to: CGPoint(x: 40, y: rect.midY + 40))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.midY - 10),
            control: CGPoint(x: 0, y: rect.midY + 40)
        )
        path.addQuadCurve(
            to: CGPoint(x: 40, y: rect.midY - 40),
            control: CGPoint(x: 20, y: rect.midY - 40)
        )
        path.addLine(to: CGPoint(x: rect.midX - 100, y: rect.midY - 40))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX - 32, y: rect.midY - 20),
            control: CGPoint(x: rect.midX - 50, y: rect.midY - 40)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.midY - 10),
            control: CGPoint(x: rect.midX - 10, y: rect.midY - 10)
        )
        return path
    }
}
