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
            .background(Circle()
                .foregroundStyle(.elementBackgrpound
                    .shadow(.inner(color: .white.opacity(0.15), radius: 6, x: 4, y: 4))
                    .shadow(.inner(color: .black.opacity(0.5), radius: 6, x: -4, y: -4))
                )
                        
            )
            
    }
}

#Preview(body: {
    LockVIew()
})
