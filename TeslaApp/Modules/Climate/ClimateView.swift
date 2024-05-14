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
    var body: some View {
        VStack {
            navBarView
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
}

#Preview {
    ClimateView()
}
