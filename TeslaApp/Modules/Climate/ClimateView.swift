//
//  ClimateView.swift
//  TeslaApp
//
//  Created by Dmitry on 14.05.2024.
//

import SwiftUI

struct ClimateView: View {
    private enum Constants {
        static let backButton = "chevron.backward"
        static let climate = "CLIMATE"
        static let ac = "Ac"
        static let fun = "Fan"
        static let heat = "Heat"
        static let auto = "Auto"
    }
    
    @Environment (\.dismiss) var dismiss
    @State var temparature = 0.0
    var body: some View {
        VStack {
            navBarView
            Spacer()
                .frame(height: 125)
            climateCircleView
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    
    var navBarView: some View {
        HStack {
           
            Button {
                dismiss()
            } label: {
                Image(systemName: Constants.backButton)
                    .foregroundStyle(.darkElement)
                    .padding()
                    .neumorphismSelectedCircleStyle()
                
                Spacer()
                
                Text(Constants.climate)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                
                NavigationLink(destination: SettingsView()) {
                    Image(.settings)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding()
                        .neumorphismSelectedCircleStyle()
                }
                    
            }

        }
        .padding(.horizontal, 30)
    }
    
    var climateCircleView: some View {
        Circle()
            .fill(.black)
            .frame(width: 168)
            .neumorphismUnselectedStyle()
            .overlay(
        Circle()
            .fill(LinearGradient(colors: [.lightShadow, .darkShadow], startPoint: .bottomTrailing, endPoint: .topLeading))
            .frame(width: 120)
        )
            .overlay(
            Text(String(Int(temparature)))
                .font(.system(size: 54))
                .foregroundStyle(.darkElement)
            )
    }
}

var buttonsView: some View {
    DisclosureGroup("") {
        VStack{
            
            HStack {
                
            }
            .padding(.horizontal, 30)
            
        }
    }
}

#Preview {
    ClimateView()
        
}
