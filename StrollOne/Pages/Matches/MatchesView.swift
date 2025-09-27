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
                .resizable()
                .aspectRatio(contentMode: .fill)
            Content()
        }
    }
}

extension MatchesView {
    @ViewBuilder
    func Content() -> some View {
        VStack {
           Text("Hello, Matches? 👋")
        }
    }
}

#Preview {
    MatchesView()
}
