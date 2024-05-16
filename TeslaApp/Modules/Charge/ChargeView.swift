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
            }
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
        
        VStack {
            Image(.battery)
            
        }
    }
}

#Preview {
    ChargeView()
}
