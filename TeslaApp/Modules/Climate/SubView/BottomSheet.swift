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
    @State var selectedColor = Color.buttonBottomGradient
    @State var temperature = 15.0
    @State var isAcOn = false
    private var temperatureRange = 15.0...30.0
    
    var gesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
        
            .onEnded { value in
                let maxHeight =  CGFloat(100)
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
            
            ClimateView(temparature: $temperature, temparatureColor: $selectedColor, isAcOn: $isAcOn)
            
            BottomMenu(isAcOn: $isAcOn, selectedColor: $selectedColor, temperature: $temperature, temperatureRange: temperatureRange)
                            .frame(height: UIScreen.main.bounds.height - 500)
                .background(RoundedRectangle(cornerRadius: 40)
                    .fill(LinearGradient(colors: [.bottomSheetTopGradient, .bottomSheetBottomGradient], startPoint: .top, endPoint: .bottom))
                )

                .offset(y: UIScreen.main.bounds.height - 405)
                .offset(y: currentMenuOffsetY)
                .gesture(gesture)
                
        }
    }
    
    
    func onChangeMenuOffset() {
        DispatchQueue.main.async {
            if gestureOffset.height + lastMenuOffsetY < 500 {
                currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
            } else {
                currentMenuOffsetY = 500
            }
        }
    }
}

#Preview {
    BottomSheet()
}
