//
//  BottomMenu.swift
//  TeslaApp
//
//  Created by Dmitry on 14.05.2024.
//

import SwiftUI

struct BottomMenu: View {
    
    private enum Constants {
        static let acON = "A/C is ON"
        static let tapAdvice = "Tap to turn off or swipe up for a fast setup"
        static let on = "On"
        static let vent = "Vent"
    }
    var body: some View {
        VStack {
            Capsule()
                .fill(.black)
                .frame(width: 110, height: 5)
                .padding()
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(Constants.acON)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .semibold))
                    Text(Constants.tapAdvice)
                        .font(.system(size: 17)
                            .weight(.semibold))
                        .foregroundStyle(.darkElement)
                }
                
                Spacer()
                    .frame(width: 60)
                
                Button(action: {
                    
                }, label: {
                    Circle()
                        .fill(LinearGradient(colors: [.buttonBottomGradient, .buttonTopGradient], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 80, height: 80)
                        .overlay(
                            Circle()
                                .fill(LinearGradient(colors: [.buttonTopGradient, .buttonBottomGradient], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    Image(.onOff)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(.white.opacity(0.6))
                                )
                        )
                    
                        
                })
                
            }
            .padding(.horizontal, 14)
            Spacer()
            
                
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    BottomSheet()
}
