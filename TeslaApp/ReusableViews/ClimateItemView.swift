//
//  SliderView.swift
//  TeslaApp
//
//  Created by Dmitry on 14.05.2024.
//

import SwiftUI

struct ClimateItemView:  View {
    @Binding var value: Double
    @Binding var isOn: Bool
    var range: ClosedRange<Double>
    var text: String
    var image: ImageResource
    var minTrackColor: Color
    
    var body: some View {
        
        HStack() {
            Text(text)
                .frame(width: 40, alignment: .leading)
            Spacer()
                .frame(width: 20)
            
            Circle()
                .fill(LinearGradient(colors: [Color(hex: "141515"), Color(hex: "2E3236")], startPoint: .bottomTrailing, endPoint: .topLeading))
                .stroke(Color(hex: "282B2E"), style: .init(lineWidth: 1))
                .frame(width: 50, height: 50)
                .overlay(
                    Image(image)
                        .renderingMode(.template)
                        .foregroundStyle(isOn ? .blue : .darkElement)
                )
            
            Spacer()
                .frame(width: 30)
            SliderView(value: $value, range: range, thumbImage: .knob, minTrackColor: minTrackColor)
        }
        .tint(.orange)
        .padding(.top, 20)
        .font(.system(size: 17)
            .weight(.semibold))
        .foregroundStyle(.darkElement)
    }
}

#Preview {
    BottomSheet()
}
