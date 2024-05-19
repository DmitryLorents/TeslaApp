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
            .foregroundStyle(.elementBackgrpound
                .shadow(.drop(color: .white.opacity(0.15), radius: 4, x: -4, y: -4))
                .shadow(.drop(color: .black.opacity(0.5), radius: 4, x: 4, y: 4))
            )
    }
}

#Preview {
    SettingsView()
}
