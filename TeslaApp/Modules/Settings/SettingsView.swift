//
//  ContentView.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    private enum Constants {
        static let open = "Open"
        static let close = "Close"
        static let lockOpen = "lock.open.fill"
        static let lockClosed = "lock.fill"
        static let tesla = "Tesla"
        static let millage = "187km"
    }
    
    @State var isCarClosed = false
    @State var tagSelected = 0
    @State var isMovedToClimate = false
    
    
    var body: some View {
        backgroundStackView(gradient: LinearGradient(colors: [.backgroundApp], startPoint: .top, endPoint: .bottom)) {
            VStack(spacing: 28) {
                headerView
                carView
                controlPanelView
                Spacer()
                    .frame(height: 40)
                if tagSelected == 1 {
                    closeCarControlView
                }
                Spacer()
                NavigationLink("", isActive: $isMovedToClimate, destination: {BottomSheet()})
            }
        }
        .navigationBarBackButtonHidden()
        
    }
    
    
    var closeCarControlView: some View {
        Button {
            withAnimation(.linear(duration: 1)) {
                isCarClosed.toggle()
            }
        } label: {
            HStack(spacing: 20) {
                Label(
                    title: { Text(isCarClosed ? Constants.close : Constants.open)
                            .foregroundStyle(.white)
                            .frame(width: 70)
                    },
                    icon: {
                        Circle()
                            .frame(width: 50, height: 50)
                        
                            .foregroundStyle(.elementBackgrpound
                                .shadow(.inner(color: .white.opacity(0.15), radius: 6, x: 4, y: 4))
                                .shadow(.inner(color: .black.opacity(0.5), radius: 6, x: -4, y: -4))
                            )
                            .overlay(
                                Image(systemName: isCarClosed ? Constants.lockOpen : Constants.lockClosed)
                                    .renderingMode(.template)
                                    .foregroundStyle(.linearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom))
                            )
                    }
                )
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 50)
                .neumorphismSelectedStyle()
            )
        }
        
    }
    
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    var controlPanelView: some View {
        HStack(spacing: 30) {
            ForEach(1..<5) { index in
                
                Button {
                    withAnimation {
                        tagSelected = index
                        if index == 2 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                isMovedToClimate.toggle()
                            })
                        }
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .neumorphismUnselectedCircleStyle()
                        .overlay(
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        )
                }
                
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50)
            .neumorphismUnselectedStyle()
        )
        
    }
    
    var carView: some View {
        Image(isCarClosed ? .open : .close)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom, 48)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }
    
    var headerView: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(Constants.tesla)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text(Constants.millage)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
            
            
        }
        .padding(25)
    }
    
}

#Preview {
    SettingsView()
    
}
