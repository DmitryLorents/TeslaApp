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
        static let charging = "CHARGING"
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

                Group {
                    chargeView
                    Spacer()
                        .frame(height: 41)
                    chargersView
                }
                .offset(y: -80)
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
            Spacer()
                Spacer()
            Spacer()
                Text(Constants.charging)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    
                    UnselectedButtonView(image: Image(.settings))
                })
                
            
            
        }
        .padding(.horizontal, 30)
    }
    
    var chargeView: some View {
        
        VStack(spacing: 5) {
            
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
    
    var chargersView: some View {
        RoundedRectangle(cornerRadius: 40)
            .neumorphismSelectedStyle()
            .frame(height: 130)
            .overlay(
                HStack {
                    Text(Constants.nearbyChargers)
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        UnselectedButtonView(image: Image(systemName: Constants.up))
                    })
                }
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal, 25)
            )
            .padding(.horizontal, 30)
    }
}

#Preview {
    ChargeView()
}
