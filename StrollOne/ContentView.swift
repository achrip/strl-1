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
        let outlineColor = UIColor.gray.cgColor
        let outlineDistance: CGFloat = 2.0
        let imageSize = CGSize(width: 25, height: 25)
        let profileImageSize = CGSize(width: imageSize.width - (outlineDistance * 2), height: imageSize.height - (outlineDistance * 2))
        
        return UIGraphicsImageRenderer(size: imageSize).image { context in
            // Calculate the centered rect for the smaller profile image
            let profileRect = CGRect(
                x: outlineDistance,
                y: outlineDistance,
                width: profileImageSize.width,
                height: profileImageSize.height
            )
            
            // Clip and draw the profile image (smaller and centered)
            let clipPath = UIBezierPath(ovalIn: profileRect)
            clipPath.addClip()
            self.draw(in: profileRect)
            
            // Reset clipping to draw the outline image on top
            context.cgContext.resetClip()
            
            // Draw the outline image with color tinting
            if let outlineImage = UIImage(named: "DrawnCircle") {
                // Draw the outline image
                let outlineRect = CGRect(origin: .zero, size: imageSize)
                outlineImage.draw(in: outlineRect)
            }
        }
        .withRenderingMode(.alwaysOriginal)
    }
}

#Preview {
    ContentView()
}
