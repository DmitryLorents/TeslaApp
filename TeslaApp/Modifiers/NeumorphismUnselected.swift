//
//  NeumorphismUnselected.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct NeumorphismUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: -5, y: -5)
            .shadow(color: .darkShadow, radius: 5, x: 5, y: 5)
    }
}
