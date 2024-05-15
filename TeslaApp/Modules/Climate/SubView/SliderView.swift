//
//  SliderView.swift
//  TeslaApp
//
//  Created by Dmitry on 14.05.2024.
//

import SwiftUI

struct SliderView:  View {
    @Binding var value: Double
    @Binding var isOn: Bool
    var range: ClosedRange<Double>
    var text: String
    var image: ImageResource
    
    var body: some View {
        
        HStack() {
            Text(text)
                .frame(width: 40, alignment: .leading)
            Spacer()
                .frame(width: 20)
            Image(image)
                .renderingMode(.template)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.zero)
                .neumorphismSelectedCircleStyle()
                .foregroundStyle(isOn ? .blue : .darkElement)
            
            Spacer()
                .frame(width: 30)
            
            Slider(value: $value, in: range)
        }
        .tint(.orange)
        .padding(.top, 20)
        .font(.system(size: 17)
            .weight(.semibold))
        .foregroundStyle(.darkElement)
    }
}
