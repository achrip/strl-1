//
//  TitleView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import Foundation
import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Your Turn")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("7")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.black)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .padding(.leading, 5)
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.caption)
                    .foregroundStyle(Color("Secondary"))
                    .fontWeight(.light)
                    .italic()
            }
            
           Spacer()
            
           makeProfileRing()
        }
        .padding(.horizontal)
    }
}

extension TitleView {
    @ViewBuilder
    func makeProfileRing() -> some View {
        ZStack(alignment: .bottom) {
            Image("Koh")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 79.56, height: 65.52)
                .clipShape(Circle())
            Circle()
                .trim(from: 0, to: 0.65)
                .stroke(Color.green, lineWidth: 4)
                .rotationEffect(.degrees(130))
                .frame(width: 80.56, height: 68.12)
            Capsule()
                .fill(Color("ProfileGrade"))
                .frame(width: 42, height: 18.4)
                .overlay(
                    Text("90")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                )
                .offset(y: 10)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 3.6)
        }
        .frame(width: 90, height: 110)
    }
}

#Preview {
    TitleView()
}
