//
//  NeumorphismUnselectedCircle.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct NeumorphismUnselectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color.background))
            .neumorphismUnselectedStyle()
    }
}
