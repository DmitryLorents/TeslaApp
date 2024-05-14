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
    @State var temparature = 15.0
    @State var colorSlider = Color.blue
    @State var fanSpeed = 0.0
    @State var heatValue = 0.0
    @State var autoValue = 0.0
    
    
    var body: some View {
        VStack {
            navBarView
            Spacer()
            climateCircleView
            Spacer()
                .frame(height: 50)
            buttonsView
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            UISlider.appearance().setThumbImage(.knob, for: .normal)
            UISlider.appearance().minimumTrackTintColor = UIColor(colorSlider)
        }
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
                    .stroke(colorSlider, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
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
            )
    }
    
    
    var buttonsView: some View {
                DisclosureGroup("") {
        VStack{
            
            SliderView(range: 15.0...30.0, value: $temparature, text: Constants.ac, image: .ac)
            SliderView(range: 0.0...1.0, value: $fanSpeed, text: Constants.fun, image: .fan)
            SliderView(range: 0.0...1.0, value: $heatValue, text: Constants.heat, image: .heat)
            SliderView(range: 0.0...1.0, value: $autoValue, text: Constants.auto, image: .auto)
            
        }
                }
                .padding(.horizontal)
        .accentColor(.blue)
    }
    
}

#Preview {
    ClimateView()
    
}
