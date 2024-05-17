//
//  TabBarShape.swift
//  TeslaApp
//
//  Created by Dmitry on 17.05.2024.
//

import SwiftUI

extension CGPoint {
    func convertToRect(_ xCoefficient: CGFloat, _ yCoefficient: CGFloat) -> CGPoint {
        CGPoint(x: x * xCoefficient, y: y * yCoefficient)
    }
    
}

struct TabBarShape: Shape {
   
    
    func path(in rect: CGRect) -> Path {
        let maxWidth = 390.0
        let maxHeight = 78.0
        let width = rect.width
        let height = rect.height
        
        let xC = width/maxWidth
        let yC = height/maxHeight
        
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 30).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 16.3, y: 12.9).convertToRect(xC, yC))
        path.addCurve(to: CGPoint(x: 46.7, y: 0).convertToRect(xC, yC), control1: CGPoint(x: 24.3, y: 4.7).convertToRect(xC, yC), control2: CGPoint(x: 35.2, y: 0).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 124.3, y: 0).convertToRect(xC, yC))
        path.addCurve(to: CGPoint(x: 148.3, y: 7.5).convertToRect(xC, yC), control1: CGPoint(x: 132.9, y: 0).convertToRect(xC, yC), control2: CGPoint(x: 141.3, y: 2.6).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 169.3, y: 22.1).convertToRect(xC, yC))
        path.addCurve(to: CGPoint(x: 220.7, y: 22.1).convertToRect(xC, yC), control1: CGPoint(x: 184.7, y: 32.9).convertToRect(xC, yC), control2: CGPoint(x: 205.3, y: 32.9).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 241.7, y: 7.5).convertToRect(xC, yC))
        path.addCurve(to: CGPoint(x: 265.7, y: 0).convertToRect(xC, yC), control1: CGPoint(x: 248.7, y: 2.6).convertToRect(xC, yC), control2: CGPoint(x: 257.1, y: 0).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 343.3, y: 0).convertToRect(xC, yC))
        path.addCurve(to: CGPoint(x: 373.7, y: 12.9).convertToRect(xC, yC), control1: CGPoint(x: 354.8, y: 0).convertToRect(xC, yC), control2: CGPoint(x: 365.7, y: 4.7).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 390, y: 30).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 390, y: 78).convertToRect(xC, yC))
        path.addLine(to: CGPoint(x: 0, y: 78).convertToRect(xC, yC))
        path.closeSubpath()

        return path
    }
}

struct previewView: View {
    var body: some View {
        Spacer()
        TabBarShape()
            .fill(.orange)
            .stroke(.white)
            .frame(width: 390, height: 78)
    }
}
#Preview {
    previewView()
}
