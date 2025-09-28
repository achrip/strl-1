//
//  ContentView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import SwiftUI

struct ContentView: View {
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
    }
}

#Preview {
    ContentView()
}
