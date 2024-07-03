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
            SettingsView()
                .tabItemApp {
                    TabItem(icon: Constants.carIcon)
                }
                .opacity(selection == 0 ? 1 : 0)
            
            ChargeView()
                .tabItemApp {
                    TabItem(icon: Constants.chargeIcon)
                }
                .opacity(selection == 1 ? 1 : 0)
            
            UnderDevelopmentView()
                .tabItemApp {
                    TabItem(icon: Constants.locationIcon)
                }
                .opacity(selection == 2 ? 1 : 0)
            
            UnderDevelopmentView()
                .tabItemApp {
                    TabItem(icon: Constants.personIcon)
                }
                .opacity(selection == 3 ? 1 : 0)
            
            
        }
    }
}

#Preview {
    MainTabView()
}
