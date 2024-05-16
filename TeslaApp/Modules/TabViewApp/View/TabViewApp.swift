//
//  TabViewApp.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct TabViewApp<Content: View> : View {
    
    let effectID = "tabBarItem"
    
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
        ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
            
            Spacer()
            Group {
                Image(element.icon, bundle: nil)
                    .renderingMode(.template)
                    .foregroundStyle(selection == index ? .white : .gray)
            }
            .overlay(
            Circle()
                .fill(LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom))
                .frame(width: 44, height: 44)
                .blur(radius: 3.0)
                .opacity(0.3)
                .matchedGeometryEffect(id: effectID, in: tabBarItem)
                
            )
            .onTapGesture {
                withAnimation {
                    selection = index
                }
            }
            
            Spacer()
        }
    }
}