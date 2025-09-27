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
        }
    }
}

#Preview {
    MatchesView()
}
