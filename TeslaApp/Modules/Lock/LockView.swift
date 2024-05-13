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
        LinearGradient(colors: [.background, isLocked ? .black : .background, .background], startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        NavigationView {
        backgroundStackView(gradient: gradient) {
            
                VStack {
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Image(.settings)
                                .resizable()
                                .frame(width: 22, height: 22)
                                .padding()
                                .neumorphismSelectedCircleStyle()
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
        }
    }
    
    private var lockView: some View {
        HStack(spacing: 20) {
            Text(isLocked ? Constants.unlock : Constants.lock)
                .font(.system(size: 17, weight: .semibold))
            Button(action: {
                withAnimation {
                    isLocked.toggle()
                }
            },
                   label: {
                Image(systemName: isLocked ? Constants.lockClosed : Constants.lockOpen)
                    .padding(3)
                    .neumorphismUnselectedCircleStyle()
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(makeGreenBlueGradient())
            })
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
            .background(Capsule()
                .fill(Color.background)
                .frame(width: 200))
            .neumorphismSelectedStyle()
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
