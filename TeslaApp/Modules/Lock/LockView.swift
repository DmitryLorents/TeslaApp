//
//  LockView.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct LockVIew: View {
    
    private enum Constants {
        static let unlock = "Unlock"
        static let lock = "Lock"
        static let lockOpen = "lock.open.fill"
        static let lockClosed = "lock.fill"
        static let hi = "Hi"
        static let welcomeBack = "Welcome back"
    }
    
    @State private var isLocked = true
    
    private var gradient: LinearGradient {
        LinearGradient(colors: [.backgroundApp, isLocked ? .black : .backgroundApp, .backgroundApp], startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        backgroundStackView(gradient: gradient) {
            
            VStack {
                
                HStack {
                    Spacer()
                    NavigationLink(destination: MainTabView()) {
                        UnselectedButtonView(image: Image(.settings))
                    }
                    
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
                Spacer()
                    .frame(height: 50)
                welcomeTextView
                Image(isLocked ? .carLocked : .carUnlocked)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                lockView
                Spacer()
                    .frame(height: 115)
                
            }
        }
        .navigationBarBackButtonHidden()
        
    }
    
    
    private var lockView: some View {
        HStack(spacing: 20) {
            Text(isLocked ? Constants.unlock : Constants.lock)
                .foregroundStyle(.white)
                .frame(width: 80)
                .font(.system(size: 17, weight: .semibold))
            Button(action: {
                withAnimation {
                    isLocked.toggle()
                }
            },
                   label: {
                Image(systemName: isLocked ? Constants.lockClosed : Constants.lockOpen)
                    .foregroundStyle(makeGreenBlueGradient())
                    .padding(3)
                    .font(.system(size: 22, weight: .semibold))
                    .neumorphismUnselectedCircleStyle()
            })
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .background(Capsule()
            .foregroundStyle(.bottomSheetBottomGradient
                .shadow(.inner(color: .white.opacity(0.15), radius: 4, x: -4, y: -4))
                .shadow(.inner(color: .black.opacity(0.5), radius: 4, x: 4, y: 4))
            )
                .frame(width: 200))
    }
    
    private var welcomeTextView: some View {
        Group {
            Text(Constants.hi)
                .font(.title2)
                .foregroundStyle(.secondary)
            Text(Constants.welcomeBack)
                .font(.title)
                .bold()
        }
        .opacity(isLocked ? 0 : 1)
    }
}

#Preview {
    LockVIew()
}
