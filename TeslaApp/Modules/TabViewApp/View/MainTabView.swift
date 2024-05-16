//
//  MainTabView.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct MainTabView: View {
    
    private enum Constants {
        static let carIcon = "carIcon"
        static let chargeIcon = "charge"
        static let locationIcon = "location"
        static let personIcon = "person"
    }
    
    @State var selection = 0
    
    var body: some View {
        TabViewApp(selection: $selection) {
            Color.red
                .ignoresSafeArea()
                .tabItemApp {
                    TabItem(icon: Constants.carIcon)
                }
                .opacity(selection == 0 ? 1 : 0)
            
            Color.red
                .ignoresSafeArea()
                .tabItemApp {
                    TabItem(icon: Constants.carIcon)
                }
                .opacity(selection == 1 ? 1 : 0)
            
            Color.red
                .ignoresSafeArea()
                .tabItemApp {
                    TabItem(icon: Constants.carIcon)
                }
                .opacity(selection == 2 ? 1 : 0)
            
            
        }
    }
}

#Preview {
    MainTabView()
}