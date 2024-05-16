//
//  NeumorphismSelectedCircle.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct NeumorphismSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color.backgroundApp))
            .neumorphismSelectedStyle()
    }
}
