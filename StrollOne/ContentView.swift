//
//  ContentView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let screen = UIScreen.main.bounds
    let profilePictureName: String = "Marie"
    
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
                    profileTabItemLabel()
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

extension ContentView {
    
    @ViewBuilder
    func profileTabItemLabel() -> some View {
        ZStack {
            Label {
                Text("Profile")
            } icon: {
                if let profilePicture = UIImage(named: profilePictureName)?.createTabItemLabelFromImage() {
                    Image(uiImage: profilePicture)
                } else {
                    Image(systemName: "person")
                }
            }
        }
        .animation(.none, value: colorScheme)
    }
}

fileprivate extension UIImage {
    
    func createTabItemLabelFromImage() -> UIImage? {
        let imageSize = CGSize(width: 25, height: 25)
        
        return UIGraphicsImageRenderer(size: imageSize).image { context in
            let rect = CGRect(origin: .init(x: 0, y: 0), size: imageSize)
            let clipPath = UIBezierPath(ovalIn: rect)
            clipPath.addClip()
            
            self.draw(in: rect)
            
            context.cgContext.resetClip()
            
            if let outlineImage = UIImage(named: "DrawnCircle") {
                outlineImage.draw(in: rect)
            }
        }
        .withRenderingMode(.alwaysOriginal)
    }
}

#Preview {
    ContentView()
}
