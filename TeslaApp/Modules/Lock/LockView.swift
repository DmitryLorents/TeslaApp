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
                    //                    Spacer()
                    NavigationLink(destination: MainTabView()) {
                        UnselectedButton(image: .settings)
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


struct UnselectedButton: View {
    var image: ImageResource
    
    var body: some View {
        Circle()
            .frame(width: 62, height: 62)
            .foregroundStyle(LinearGradient(colors: [.unselectedCircleTop, .unselectedCircleBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.drop(color: .black.opacity(0.25), radius: 20, x: 10, y: 10))
            )
            .blur(radius: 20)
            .overlay(
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(.radialGradient(colors: [Color(hex: "3E4145"), Color(hex: "232629")], center: .center, startRadius: 0, endRadius: 50)
                    .shadow(.inner(color: .black.opacity(0.35), radius: 3, x: 0, y: 2))
                                )
                .overlay(
                    Circle()
                        .stroke(LinearGradient(colors: [Color(hex: "1C1D1F"), Color(hex: "303438")], startPoint: .topLeading, endPoint: .bottomTrailing), style: .init(lineWidth: 3))
                        .shadow(color: .black.opacity(0.35), radius: 4, x: 0, y: 4)
                        .frame(width: 50, height: 50)
                        
                )
                .overlay(
                    Image(.settings)
                        
                )
            
            )
        //        // Image
        //        Image(image)
        //            .resizable()
        //            .frame(width: 22, height: 22)
        //            .padding()
        //            .padding(.all, 8)
        //            .background(Circle()
        //
        //                .foregroundStyle(.elementBackgrpound
        //                    .shadow(.inner(color: .white.opacity(0.15), radius: 8, x: 4, y: 4))
        //                    .shadow(.inner(color: .black.opacity(0.5), radius: 8, x: -4, y: -4))
        //
        //
        //                )
        //                    .background(
        //                        Circle()
        //
        //                            .stroke(LinearGradient(colors: [.black, .white.opacity(0.25)], startPoint: .topLeading, endPoint: .bottomTrailing), style: .init(lineWidth: 4))
        //                            .frame(width: 80, height: 80)
        //                            .padding(10)
        
        //                                            .background(
        //                                                Circle()
        //                                                    .frame(width: 100, height: 100)
        //                                                    .foregroundStyle(LinearGradient(colors: [.unselectedCircleTop, .unselectedCircleBottom], startPoint: .topLeading, endPoint: .bottomTrailing)
        //                                                        .shadow(.inner(color: .white.opacity(0.15), radius: 8, x: 4, y: 4))
        //                                                        .shadow(.inner(color: .black.opacity(0.5), radius: 8, x: -4, y: -4)))
        //
        //
        //                                            )
        //                                            .blur(radius: 1)
        
        //                    )
        
    }
}
