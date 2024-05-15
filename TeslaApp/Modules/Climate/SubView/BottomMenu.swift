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
        static let less = "chevron.left"
        static let more = "chevron.right"
        static let degree = "\u{00B0}"
    }
    
    @Binding var selectedColor: Color
    @Binding var temperature: Double
    var temperatureRange: ClosedRange<Double>
    
    var body: some View {
        VStack(spacing: 20) {
            Capsule()
                .fill(.black)
                .frame(width: 110, height: 5)
                .padding(.top)
            
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

                    onOffButton
                    
                })
                .offset(x: 10)
                
            }
            
            temperatureAdjustView
            
            HStack {
                Text(Constants.on)
                Spacer()
                Text(Constants.vent)
            }
            
            
            Spacer()
        }
        .foregroundStyle(.darkElement)
        .padding(.horizontal, 30)
        .frame(width: UIScreen.main.bounds.width)
        
    }
    
   
    
    private var onOffButton: some View {
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

    }
    
    private var stepperView: some View {
        HStack {
            
            Button(action: {
                if temperature > temperatureRange.lowerBound {
                    temperature -= 1
                }
            }, label: {
                Image(systemName: Constants.less)
                    
            })
            
            Text("\(Int(temperature))\(Constants.degree)")
                .foregroundStyle(.white)
                .font(.title)
                .padding(.horizontal)
            
            Button(action: {
                if temperature < temperatureRange.upperBound {
                    temperature += 1
                }
            }, label: {
                Image(systemName: Constants.more)
                    
            })
            
        }
    }
    
    private var temperatureAdjustView: some View {
        HStack {
            ColorPicker("", selection: $selectedColor)
            .frame(width: 40, alignment: .leading)
            Spacer()
            stepperView
            Spacer()
            Image(.vent)
                .renderingMode(.template)
        }
    }
    
}

#Preview {
    BottomSheet()
}
