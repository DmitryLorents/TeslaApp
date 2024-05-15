//
//  BottomSheet.swift
//  TeslaApp
//
//  Created by Dmitry on 14.05.2024.
//

import SwiftUI

struct BottomSheet: View {
    
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    @State var selectedColor = Color.red
    @State var temperature = 15.0
    private var temperatureRange = 15.0...30.0
    
    var gesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
        
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height - 100
                withAnimation {
                    if -currentMenuOffsetY > maxHeight / 2 {
                        currentMenuOffsetY = -maxHeight
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
        
    }
    var body: some View {
        ZStack {
            
            ClimateView(temparature: $temperature, temparatureColor: $selectedColor)
                .offset(y: 300)
            
            BottomMenu(selectedColor: $selectedColor, temperature: $temperature, temperatureRange: temperatureRange)
            
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 500)
                .background(RoundedRectangle(cornerRadius: 40)
                    .fill(LinearGradient(colors: [.bottomSheetTopGradient, .bottomSheetBottomGradient], startPoint: .top, endPoint: .bottom))
                )
                .ignoresSafeArea(.all)
                .offset(y: UIScreen.main.bounds.height)
                .offset(y: currentMenuOffsetY)
                .gesture(gesture)

            
        }
        .onChange(of: selectedColor) {
            print("On change")
            print(selectedColor)
            UISlider.appearance().setThumbImage(.knob, for: .normal)
                        UISlider.appearance().minimumTrackTintColor = UIColor(selectedColor)
        }
        .onAppear() {
            UISlider.appearance().setThumbImage(.knob, for: .normal)
            UISlider.appearance().minimumTrackTintColor = UIColor(selectedColor)
        }
    }
    
    
    func onChangeMenuOffset() {
        DispatchQueue.main.async {
            currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
        }
    }
}

#Preview {
    BottomSheet()
}
