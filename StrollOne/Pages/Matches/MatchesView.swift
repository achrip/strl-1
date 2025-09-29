//
//  MatchesView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import Foundation
import SwiftUI

struct MatchesView: View {
    
    var body: some View {
        ZStack {
            Image("BonfireBG")
                .resizable(resizingMode: .stretch)
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .clear, location: 0.1),
                    .init(color: Color("Background"), location: 0.3)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            Content()
        }
    }
}

extension MatchesView {
    @ViewBuilder
    func Content() -> some View {
        VStack {
            TitleView()
            CarouselView()
            ChatView()
        }
    }
}

#Preview {
    MatchesView()
}
