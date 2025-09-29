//
//  CarouselView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import SwiftUI

struct CarouselView: View {
    
    @StateObject var vm: CarouselViewModel = .init()
    
    let screen = UIScreen.main.bounds
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: screen.width * 0.01) {
                ForEach(vm.recentMoves, id: \.id) { card in
                    makeCard(card)
                }
            }
            .padding(.horizontal)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .frame(maxHeight: UIScreen.main.bounds.height * 0.26)
        .padding(.bottom, 3)
    }
}

extension CarouselView {
    @ViewBuilder
    func makeCard(_ card: YourTurnCard) -> some View {
        let font = UIFont.proximaNova(forTextStyle: .caption1)
        ZStack {
            Image(card.image)
                .resizable(resizingMode: .stretch)
                .blur(radius: card.isHidden ? 20 : 0)
            
            if card.isHidden { makeScreen() }
            
            VStack {
                if card.notice != .none {
                    makeNotification(for: card.notice)
                }
                
                Spacer()
                Text("\(card.sender.name), \(card.sender.age)")
                    .font(.proximaNova(forTextStyle: .callout, weight: .bold))
                    .foregroundStyle(Color.white)
                
                Text(card.caption)
                    .font(.proximaNova(forTextStyle: .caption1))
                    .foregroundStyle(Color("YourTurnCardCaption"))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .frame(maxWidth: screen.width * 0.29)
                    .offset(y: font.pointSize * 0.5)
            }
            .padding()
        }
        .frame(width: screen.width * 0.3866667, height: screen.height * 0.25184275)
        .clipShape(RoundedRectangle(cornerRadius: 21))
        .padding(.horizontal, 6)
    }
    
    @ViewBuilder
    func makeScreen() -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.clear)
                .background(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: Color("CardScreen").opacity(0.8044), location: 0.66),
                            .init(color: Color("CardScreen").opacity(1.0), location: 1.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Text("Tap to answer")
                .font(.proximaNova(forTextStyle: .caption1, weight: .bold))
                .foregroundStyle(Color("YourTurnCardCaption"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func makeNotification(for notice: NoticeType) -> some View {
            HStack {
                Text("\(notice.icon) \(notice.description)")
                    .font(.proximaNova(forTextStyle: .caption2, weight: .semibold))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 7)
            }
            .background(Color(.systemBackground))
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    CarouselView()
}
