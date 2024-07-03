//
//  LogoShape.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct LogoShape: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        
        var path = Path()
        path.move(to: CGPoint(x: 150, y: 67))
        path.addLine(to: CGPoint(x: 181, y: 29.2))
        path.addCurve(to: CGPoint(x: 286.8, y: 54.9), control1: CGPoint(x: 181, y: 29.2), control2: CGPoint(x: 234, y: 30.3))
        path.addCurve(to: CGPoint(x: 246.4, y: 85.4), control1: CGPoint(x: 273.3, y: 75.3), control2: CGPoint(x: 246.4, y: 85.4))
        path.addCurve(to: CGPoint(x: 192, y: 63), control1: CGPoint(x: 244.6, y: 67.4), control2: CGPoint(x: 232, y: 63))
        path.addLine(to: CGPoint(x: 171, y: 181.5))
        path.addLine(to: CGPoint(x: 150, y: 300))
        path.addLine(to: CGPoint(x: 107.7, y: 63))
        path.addCurve(to: CGPoint(x: 53.6, y: 85.3), control1: CGPoint(x: 68, y: 63), control2: CGPoint(x: 55.4, y: 67.4))
        path.addCurve(to: CGPoint(x: 13.2, y: 54.9), control1: CGPoint(x: 53.6, y: 85.3), control2: CGPoint(x: 26.7, y: 75.4))
        path.addCurve(to: CGPoint(x: 119.1, y: 29.3), control1: CGPoint(x: 66, y: 30.4), control2: CGPoint(x: 119.1, y: 29.3))
        path.closeSubpath()
        
        path.move(to: CGPoint(x: 150, y: 18.3))
        path.addCurve(to: CGPoint(x: 291.6, y: 46.8), control1: CGPoint(x: 192.7, y: 17.9), control2: CGPoint(x: 241.6, y: 24.9))
        path.addCurve(to: CGPoint(x: 300, y: 29.3), control1: CGPoint(x: 298.3, y: 34.7), control2: CGPoint(x: 300, y: 29.3))
        path.addCurve(to: CGPoint(x: 150, y: 0), control1: CGPoint(x: 245.3, y: 7.7), control2: CGPoint(x: 194.1, y: 0.2))
        path.addCurve(to: CGPoint(x: 0, y: 29.3), control1: CGPoint(x: 105.9, y: 0.2), control2: CGPoint(x: 54.7, y: 7.6))
        path.addCurve(to: CGPoint(x: 8.4, y: 46.8), control1: CGPoint(x: 0, y: 29.3), control2: CGPoint(x: 2.4, y: 35.9))
        path.addCurve(to: CGPoint(x: 150, y: 18.3), control1: CGPoint(x: 58.5, y: 24.9), control2: CGPoint(x: 107.3, y: 17.9))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    SplashScreenView()
}
