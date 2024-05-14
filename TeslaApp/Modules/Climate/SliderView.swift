//
//  SliderView.swift
//  TeslaApp
//
//  Created by Dmitry on 14.05.2024.
//

import SwiftUI

struct SliderView:  View {
    var range: ClosedRange<Double>
    @Binding var value: Double
    var text: String
    var image: ImageResource
    
    var body: some View {
        
        HStack() {
            Text(text)
                .frame(width: 40, alignment: .leading)
            Spacer()
                .frame(width: 20)
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.zero)
                .neumorphismSelectedCircleStyle()
            
            Spacer()
                .frame(width: 30)
            
            Slider(value: $value, in: range)
        }
//        .padding(.horizontal, 30)
        .padding(.top, 20)
        .font(.system(size: 17)
            .weight(.semibold))
        .foregroundStyle(.darkElement)
    }
}
