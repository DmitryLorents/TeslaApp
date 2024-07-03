//
//  SliderView.swift
//  TeslaApp
//
//  Created by Dmitry on 17.05.2024.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    @State var lastCoordinateValue: CGFloat = 0.0
    var range: ClosedRange<Double> = 1...10
    var thumbImage: ImageResource
    var thumbColor: Color = .yellow
    var minTrackColor: Color = .blue
    var maxTrackColor: Color = .sliderBackground
    var trackThickness: Double = 7.5
    
    
    var body: some View {
        GeometryReader(content: { gr in
            let thumbHeight = gr.size.height * 1.1
            let thumbWidth = gr.size.width * 0.03
            let radius = gr.size.height * 0.5
            let minValue = gr.size.width * 0.015
            let maxValue = (gr.size.width * 0.98) - thumbWidth
            
            let scaleFactor = (maxValue - minValue) / (range.upperBound - range.lowerBound)
            let lower = range.lowerBound
            let sliderValue = (value - lower) * scaleFactor + minValue
            
            ZStack {
                // Max track
                Rectangle()
                    .foregroundStyle(maxTrackColor)
                    .shadow(color: .white.opacity(1), radius: 4, x: -2, y: -2)
                    .shadow(color: .black.opacity(0.8), radius: 4, x: 2, y: 2)
                    .frame(width: gr.size.width, height: trackThickness)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                // Min track
                HStack {
                    Rectangle()
                        .foregroundStyle(minTrackColor)
                        .shadow(color: .white.opacity(0.08), radius: 4, x: -2, y: -2)
                        .shadow(color: .black.opacity(0.8), radius: 4, x: 2, y: 2)
                        .frame(width: sliderValue, height: trackThickness)
                    Spacer()
                }
                .clipShape(RoundedRectangle(cornerRadius: radius))
                // Thumb
                HStack {
                    Image(thumbImage)
                        .frame(width: thumbWidth, height: thumbHeight)
                        .offset(x: sliderValue)
                        .gesture(
                            
                        DragGesture(minimumDistance: 0)
                            .onChanged({ v in
                                if (abs(v.translation.width) < 0.1 ) {
                                    lastCoordinateValue = sliderValue
                                }
                                if v.translation.width > 0 {
                                    let nextCoordinateValue = min(maxValue, lastCoordinateValue + v.translation.width)
                                    value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                } else {
                                    let nextCoordinateValue = max(minValue, lastCoordinateValue + v.translation.width)
                                    value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                }
                            })
                        
                        )
                    Spacer()
                }
                
            }
        })
    }
}

struct TestView: View {
    
    @State var value: Double = 3
    var body: some View {
        SliderView(value: $value, thumbImage: .knob)
            .padding(.horizontal, 30)
            
    }
}

#Preview {
    TestView()
}
