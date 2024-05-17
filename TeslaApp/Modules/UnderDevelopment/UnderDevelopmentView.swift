//
//  UnderDevelopmentView.swift
//  TeslaApp
//
//  Created by Dmitry on 17.05.2024.
//

import SwiftUI

struct UnderDevelopmentView: View {
    private enum Constants {
        static let gearImage = "gearshape.2"
        static let text = "Under development"
    }
    
    var body: some View {
        ZStack {
            Color.backgroundApp
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                Image(systemName: Constants.gearImage)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.darkElement)
                    .padding(.horizontal, 100)
                Text(Constants.text)
                    .font(.title)
                    .bold()
            }
            .foregroundStyle(.darkElement)
        }
        
        
        
    }
}

#Preview {
    UnderDevelopmentView()
}
