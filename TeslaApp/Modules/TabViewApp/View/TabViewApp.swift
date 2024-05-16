//
//  TabViewApp.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct TabViewApp<Content: View> : View {
    
    @Binding var selection: Int
    @Namespace private var tabBarItem
    @State private var tabs: [TabItem] = []
    private var content: Content
    
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        _selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            content
            
            HStack {
                tabsView
            }
            .frame(minWidth: .infinity)
            .frame(height: 78)
            .background(
                Color.black
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            
        })
        .onPreferenceChange(TabItemPreferenceKey.self, perform: { value in
            tabs = value
        })
    }
    
    private var tabsView: some View {
        Text("")
    }
}
