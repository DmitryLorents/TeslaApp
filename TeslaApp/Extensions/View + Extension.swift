//
//  ViewModifier + Extension.swift
//  TeslaApp
//
//  Created by Dmitry on 13.05.2024.
//

import SwiftUI

extension View {
    func neumorphismUnselectedStyle() -> some View {
        modifier(NeumorphismUnselected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismUnselectedCircleStyle() -> some View {
        modifier(NeumorphismUnselectedCircle())
    }
    
    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismSelectedCircle())
    }
    
    func backgroundStackView<Content: View>(gradient: LinearGradient, content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(gradient)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
    
    func makeGreenBlueGradient() -> LinearGradient {
        LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .bottom, endPoint: .top)
    }
    
    func tabItemApp(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifier(tabBarItem: label()))
    }
    
}
