//
//  ContentView.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isCarClosed = false
    @State var tagSelected = 0
    @State var isMovedToClimate = false
    
    
    var body: some View {
        backgroundStackView(gradient: LinearGradient(colors: [.background], startPoint: .top, endPoint: .bottom)) {
            VStack {
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
            withAnimation {
                isCarClosed.toggle()
            }
        } label: {
            HStack(spacing: 40) {
                Label(
                    title: { Text(isCarClosed ? "Close" : "Open")
                        .foregroundStyle(.white)},
                    icon: { Image(systemName: isCarClosed ? "lock.open.fill" : "lock.fill")
                            .renderingMode(.template)
                            .neumorphismUnselectedCircleStyle()
                    }
                )
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 50)
                .fill(Color.background))
            .neumorphismSelectedStyle()
        }
        .frame(width: 300)

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
        .background(RoundedRectangle(cornerRadius: 50).fill(Color.background))
        .neumorphismUnselectedStyle()
    }
    
    var carView: some View {
        Image(isCarClosed ? .car : .car)
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
                Text("Tesla")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("187rm")
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
