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
        static let support = "Tesla Support"
        static let urlString = "https://www.tesla.com/support "
        static let ok = "OK"
        static let visitSupport = "Please visit our site:"
    }
    
    @Environment (\.dismiss) var dismiss
    @Binding var temparature: Double
    @Binding var temparatureColor: Color
    @Binding var isAcOn: Bool
    @State var isOn = false
    @State var fanSpeed = 0.0
    @State var heatValue = 0.0
    @State var autoValue = 0.0
    @State var isAlertShown = false
    
    
    
    var body: some View {
        ZStack {
            Color(hex: "26282C")
                .ignoresSafeArea()
            VStack {
                navBarView
                ScrollView {
                    climateCircleView
                        .padding(.top, 113)
                    Spacer()
                        .frame(height: 50)
                    slidersView
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .navigationBarBackButtonHidden()
            
            
            alertView
                .opacity(isAlertShown ? 1 : 0)
                .offset(x: isAlertShown ? 0 : 60, y: isAlertShown ? 0 : -200)
            
            
        }
        
    }
    
    var alertView: some View {
        VStack{
            Link(destination: URL(string: Constants.urlString)!, label: {
                VStack(spacing: 10) {
                    Text(Constants.visitSupport)
                        .foregroundStyle(.darkElement)
                    Text(Constants.support)
                        .font(.system(size: 20))
                        .bold()
                        .underline()
                }
                    .padding(12)
                    .transition(.opacity.combined(with: .scale))
            })
            
            Divider()
                .frame(maxWidth: 220)
                .overlay(
                    Color.white
                )
            
            Button(Constants.ok) {
                withAnimation {
                    isAlertShown = false
                }
            }
            .padding(8)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.bottomSheetTopGradient)
        )
        
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
                    withAnimation(.easeInOut(duration: 1)) {
                        isAlertShown = true
                    }
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
    
    var climateCircleView: some View {
        Circle()
            .frame(width: 168)
            .foregroundStyle(LinearGradient(colors: [Color(hex: "2B2F33"), Color(hex: "111315")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.drop(color: Color(hex: "141414"), radius: 60, x: 18, y: 18))
                .shadow(.drop(color: Color(hex: "485057"), radius: 60, x: -18, y: -18))
            )

            .padding(4)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: CGFloat(temparature - 15) / 15)
                    .stroke(temparatureColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .shadow(color: temparatureColor, radius: 10)
                    .opacity(isAcOn ? 1: 0)
                
            )
            .overlay(
                Circle()
                    .fill(Color(hex: "32363B")
                        .shadow(.inner(color: .white.opacity(0.05), radius: 2, x: 2, y: 1))
                        .shadow(.inner(color: Color(hex: "3B4451").opacity(0.5), radius: 66, x: -26, y: -26))
                        .shadow(.inner(color: .black.opacity(0.55), radius: 81, x: 26, y: 26))
                         )
                    .frame(width: 120)
            )
            .overlay(
                Text(String(Int(temparature)))
                    .font(.system(size: 54))
                    .foregroundStyle(.darkElement)
                    .opacity(isAcOn ? 1: 0)
            )
    }
    
    
    var slidersView: some View {
        DisclosureGroup("") {
            
            VStack{
                ClimateItemView(value: $temparature, isOn: $isAcOn , range: 15.0...30.0, text: Constants.ac, image: .ac, minTrackColor: temparatureColor)
                ClimateItemView(value: $fanSpeed, isOn: $isOn, range: 0.0...1.0, text: Constants.fun, image: .fan, minTrackColor: temparatureColor)
                ClimateItemView(value: $heatValue,isOn: $isOn, range: 0.0...1.0, text: Constants.heat, image: .heat, minTrackColor: temparatureColor)
                ClimateItemView(value: $autoValue, isOn: $isOn, range: 0.0...1.0, text: Constants.auto, image: .auto, minTrackColor: temparatureColor)
                Rectangle()
                    .fill(.clear)
                    .frame(height: 200)
            }
            .padding(.horizontal, 20)
            
            
        }
        .padding(.horizontal)
        .font(.title)
        .bold()
        .foregroundStyle(.white)
        .tint(.blue)
    }
    
}

#Preview {
    BottomSheet()
}
