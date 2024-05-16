//
//  TabItemModifier.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct TabItemModifier: ViewModifier {
    let tabBarItem: TabItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenceKey.self, value: [tabBarItem])
    }
}
