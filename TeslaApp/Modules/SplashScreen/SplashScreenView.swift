//
//  SplashScreenView.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var progress = 0.0
    @State var isShown = false
    @State var isMovedToLockScreen = false
    private var initialDelay = 3.0
    private var secondDelay = 4.0
    private let strokeWidth = 6.0
    
    var body: some View {
        
        ZStack {
            NavigationLink("", destination: LockVIew(), isActive: $isMovedToLockScreen)
            if isShown {
                logoView
                    .transition(.push(from: .bottom).combined(with: .opacity))
            }
            logoContour
        }.onAppear()
        {
            withAnimation(.linear(duration: initialDelay)) {
                isShown = true
            }
            withAnimation(.linear(duration: secondDelay).delay(initialDelay)) {
                progress = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + initialDelay + secondDelay + 0.5, execute: {
                isMovedToLockScreen = true
            })
            
            
        }
        
    }
    private var logoView: some View {
        LogoShape()
            .fill(.bottomSheetTopGradient)
            .frame(width: 300, height: 300)
        
    }
    private var logoContour: some View {
        LogoShape()
            .trim(from: 0.0, to: progress)
            .stroke(.buttonBottomGradient, style: .init(lineWidth: strokeWidth, lineCap: .round))
            .background(
                LogoShape()
                    .trim(from: 0.0, to: progress)
                    .stroke(.buttonBottomGradient, lineWidth: strokeWidth + 1)
                    .blur(radius: strokeWidth + 3)
            )
            .frame(width: 300, height: 300)
    }
}

#Preview {
    SplashScreenView()
}
