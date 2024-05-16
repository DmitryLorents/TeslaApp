//
//  ChargeView.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct ChargeView: View {
    
    private enum Constants {
        static let backButton = "chevron.backward"
        static let climate = "CHARGING"
        static let percentSign = "%"
        static let setLimit = "Set Charge Limit"
        static let nearbyChargers = "Nearby SuperChargers"
        static let up = "chevron.up"
        static let down = "chevron.down"
        
    }
    
    @Environment(\.dismiss) private var dismiss
    @State var chargeProgress = 65.0
    @State var chargeLimit = 75.0
    private let chargeRange = 0.0...100.0
    private let step = 25.0
    private var stepQuantity: Int {
        Int(chargeRange.upperBound / step)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundApp
                .ignoresSafeArea()
            VStack {
                navBarView
                
                Image(.carCharge)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                
                chargeView
                
                Spacer()
            }
        }
        .onAppear(){
            UISlider.appearance().setThumbImage(.knobRect, for: .normal)
            UISlider.appearance().minimumTrackTintColor = .systemGray4
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
                Button(action: {
                    
                }, label: {
                    Image(.settings)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding()
                        .neumorphismSelectedCircleStyle()
                })
                
            }
            
        }
        .padding(.horizontal, 30)
    }
    
    var chargeView: some View {
        
        VStack(spacing: 0) {
            
            Image(.battery)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                ForEach(0...stepQuantity, id: \.self) { index in
                    VStack(alignment: .trailing) {
                        Rectangle()
                            .fill(LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom))
                            .frame(width: 2, height: 9)
                            .opacity(chargeLimit == Double(index)*step ? 1 : 0.5)
                        Text("\(index * Int(step))\(Constants.percentSign)")
                            .font(.system(size: 13))
                            .foregroundStyle(chargeLimit == Double(index)*step ? .white : .secondary)
                    }
                    if index < stepQuantity {
                        Spacer()
                    }
                }
            }
            
            Slider(value: $chargeLimit, in: 0...100, step: 25.0)
                .labelsHidden()
                .padding(.horizontal, 2)
            
            Text(Constants.setLimit)
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
            
        }
        .padding(.horizontal, 58)
        .background(
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("\(Int(chargeProgress))")
                    .font(.system(size: 34))
                    .bold()
                Text(Constants.percentSign)
                    .font(.system(size: 20))
                    .foregroundStyle(.secondary)
            }
                .padding(.top, 30)
            , alignment: .top)
    }
}

#Preview {
    ChargeView()
}
