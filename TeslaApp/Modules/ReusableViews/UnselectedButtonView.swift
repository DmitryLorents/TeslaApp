//
//  UnselectedButtonView.swift
//  TeslaApp
//
//  Created by Dmitry on 19.05.2024.
//

import SwiftUI

struct UnselectedButtonView: View {
    var image: Image
    
    
    var body: some View {
        Circle()
            .frame(width: 62, height: 62)
            .foregroundStyle(
                LinearGradient(colors: [.unselectedCircleTop, .unselectedCircleBottom], startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .shadow(.drop(color: .black.opacity(0.25), radius: 20, x: 10, y: 10))
            )
            .blur(radius: 20)
        
            .overlay(
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(
                        .radialGradient(colors: [Color(hex: "3E4145"), Color(hex: "232629")], center: .center,
                                        startRadius: 0,
                                        endRadius: 50)
                        .shadow(.inner(color: .black.opacity(0.35), radius: 3, x: 0, y: 2))
                    )
            )
        
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Color(hex: "1C1D1F"), Color(hex: "303438")], startPoint: .topLeading,
                            endPoint: .bottomTrailing),
                        style: .init(lineWidth: 1.5)
                    )
                    .shadow(color: .black.opacity(0.35), radius: 4, x: 0, y: 4)
                    .frame(width: 50, height: 50)
                
            )
        
            .overlay(
                image
                    .renderingMode(.template)
                    .foregroundStyle(Color(hex: "97979D"))
            )
        
    }
}

#Preview {
    ChargeView()
}
