//
//  ContentView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import SwiftUI

struct ContentView: View {
    let screen = UIScreen.main.bounds
    var body: some View {
        TabView {
            CardsView()
                .tabItem {
                    Label("Cards", image: "Cards")
                }
                .badge(10)
            BonfireView()
                .tabItem {
                    Label("Bonfire", image: "Bonfire")
                }
            MatchesView()
                .tabItem {
                    Label("Matches", image: "Matches")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(
                    Color("TabBarBackground"), for: .tabBar
                )
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .overlay(alignment: .bottom) {
            LinearGradient(gradient: Gradient(colors: [.clear, Color("TabBarBackground")]), startPoint: .top, endPoint: .bottom)
                .frame(height: screen.height * 0.05)
                .offset(y: -49)
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
}
