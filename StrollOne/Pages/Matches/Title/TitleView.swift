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
                        .font(.proximaNova(forTextStyle: .title2, weight: .bold))
                    
                    Text("7")
                        .font(.proximaNova(forTextStyle: .caption1, weight: .bold))
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.black)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .padding(.leading, 5)
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.proximaNova(forTextStyle: .footnote, weight: .thin))
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
//                .shadow(color: .white.opacity(0.9), radius: 2)
                .shadow(color: Color("Secondary").opacity(0.6), radius: 12)
            Circle()
                .trim(from: 0, to: 0.875)
                .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(135))
                .frame(width: 80.56, height: 68.12)
            Circle()
                .trim(from: 0, to: 0.7) // Example progress (7/8 max)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color("ProgressBar/Green1"), location: 0.0),
                            .init(color: Color("ProgressBar/Green2"), location: 0.85),
                            .init(color: Color("ProgressBar/Green1"), location: 1.0)
                        ]),
                        center: .center,
                        startAngle: .degrees(135),
                        endAngle: .degrees(135 + 360 * 0.875)
                    ),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .rotationEffect(.degrees(135))
                .frame(width: 80.56, height: 68.12)
//            Circle()
//                .trim(from: 0, to: 0.7)
//                .stroke(Color.red, lineWidth: 4)
//                .rotationEffect(.degrees(135))
//                .frame(width: 80.56, height: 68.12)
//                .rotationEffect(.degrees(135))
//                .overlay(
//                    Rectangle()
//                        .fill(Color.white)
//                        .frame(width: 2, height: 10)
//                        .offset(y: -4),
//                    alignment: .top
//                )
            Capsule()
                .fill(Color("ProfileGrade"))
                .frame(width: 42, height: 18.4)
                .overlay(
                    Text("90")
                        .font(UIFont.proximaNova(forTextStyle: .caption1, weight: .bold).withSize(10.8).toFont())
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
