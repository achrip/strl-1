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
                    Label("Cards", systemImage: "simcard.2")
                }
            BonfireView()
                .tabItem {
                    Label("Bonfire", systemImage: "flame")
                }
            MatchesView()
                .tabItem {
                    Label("Matches", systemImage: "bubble.left.and.bubble.right.fill")
                }
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
