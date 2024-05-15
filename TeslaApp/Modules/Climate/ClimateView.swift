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
    @Binding var temparature: Double
    @Binding var temparatureColor: Color
    @Binding var isAcOn: Bool
    @State var isOn = false
    @State var fanSpeed = 0.0
    @State var heatValue = 0.0
    @State var autoValue = 0.0
    
    
    
    var body: some View {
        VStack {
            navBarView
            ScrollView {
                climateCircleView
                    .padding(.top, 113)
                Spacer()
                    .frame(height: 50)
                slidersView
            }
            .scrollIndicators(.hidden)
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
            .padding(4)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: CGFloat(temparature - 15) / 15)
                    .stroke(temparatureColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .opacity(isAcOn ? 1: 0)
                
            )
            .overlay(
                Circle()
                    .fill(LinearGradient(colors: [.lightShadow, .darkShadow], startPoint: .bottomTrailing, endPoint: .topLeading))
                    .frame(width: 120)
            )
            .overlay(
                Text(String(Int(temparature)))
                    .font(.system(size: 54))
                    .foregroundStyle(.darkElement)
                    .opacity(isAcOn ? 1: 0)
            )
    }
    
    
    var slidersView: some View {
        DisclosureGroup("") {
            
            VStack{
                SliderView(value: $temparature, isOn: $isAcOn , range: 15.0...30.0, text: Constants.ac, image: .ac)
                SliderView(value: $fanSpeed, isOn: $isOn, range: 0.0...1.0, text: Constants.fun, image: .fan)
                SliderView(value: $heatValue,isOn: $isOn, range: 0.0...1.0, text: Constants.heat, image: .heat)
                SliderView(value: $autoValue, isOn: $isOn, range: 0.0...1.0, text: Constants.auto, image: .auto)
                Rectangle()
                    .fill(.clear)
                    .frame(height: 200)
            }
            
            
        }
        .padding(.horizontal)
        .font(.title)
        .bold()
        .foregroundStyle(.white)
        .tint(.blue)
    }
    
}

#Preview {
    BottomSheet()
}
