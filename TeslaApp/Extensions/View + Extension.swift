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
    
}
