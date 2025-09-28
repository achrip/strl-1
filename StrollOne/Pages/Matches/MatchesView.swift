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
            Image("starry-night")
                .resizable(resizingMode: .stretch)
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .clear, location: 0.25),
                    .init(color: .black, location: 1.0)
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
        VStack(spacing: 0) {
            TitleView()
            CarouselView()
            ChatView()
        }
    }
}

#Preview {
    MatchesView()
}
