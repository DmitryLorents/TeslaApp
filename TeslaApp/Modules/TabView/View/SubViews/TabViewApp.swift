//
//  TabViewApp.swift
//  TeslaApp
//
//  Created by Dmitry on 16.05.2024.
//

import SwiftUI

struct TabViewApp<Content: View> : View {
    
    let effectID = "tabBarItem"
    var tabBarHeight = 80.0
    
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
            .frame(maxWidth: .infinity)
            .frame(height: 78)
            .background(
                TabBarShape()
                    .fill(Color(hex: "232527"))
                    .shadow(color: .darkElement.opacity(0.1), radius: 3)
                    .frame(width: UIScreen.main.bounds.width, height: tabBarHeight)

                
            )
            
        })
        .ignoresSafeArea(.all, edges: .bottom)
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
                ZStack{
                    if selection == index {
                        Circle()
                            .fill(LinearGradient(colors: [.gradientTop, .gradientBottom], startPoint: .top, endPoint: .bottom))
                            .frame(width: 60, height: 60)
                            .blur(radius: 15.0)
                            .opacity(0.4)
                            .matchedGeometryEffect(id: effectID, in: tabBarItem)
                    }
                }
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

#Preview {
    MainTabView()
}
