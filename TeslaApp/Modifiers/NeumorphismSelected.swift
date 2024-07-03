//
//  NeumorphismSelected.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.elementBackgrpound
                .shadow(.inner(color: .white.opacity(0.15), radius: 4, x: -4, y: -4))
                .shadow(.inner(color: .black.opacity(0.5), radius: 4, x: 4, y: 4))
            )
    }
}


