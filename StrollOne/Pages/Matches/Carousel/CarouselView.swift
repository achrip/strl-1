//
//  CarouselView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import SwiftUI

struct CarouselView: View {
    
    @StateObject var vm: CarouselViewModel = .init()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(vm.recentMoves, id: \.id) {card in
                        makeCard(card, with: geometry)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .fixedSize()
            .padding()
        }
    }
}

extension CarouselView {
    @ViewBuilder
    func makeCard(_ card: YourTurnCard, with geometry: GeometryProxy) -> some View {
        ZStack {
            Image(card.image)
                .resizable(resizingMode: .stretch)
                .blur(radius: card.isHidden ? 50 : 0)
            
            if card.isHidden { makeScreen() }
            
            VStack {
                if card.notice != .none {
                    makeNotification(for: card.notice)
                }
                
                Spacer()
                Text("\(card.sender.name), \(card.sender.age)")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                
                Text(card.caption)
                    .font(.caption2)
                    .foregroundStyle(Color("YourTurnCardCaption"))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .frame(width: geometry.size.width * 0.386666667, height: geometry.size.height * 0.299291153)
        .clipShape(RoundedRectangle(cornerRadius: 21))
        .padding(.horizontal, 6)
    }
    
    @ViewBuilder
    func makeScreen() -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
            
            Text("Tap to answer")
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundStyle(Color("YourTurnCardCaption"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func makeNotification(for notice: NoticeType) -> some View {
        ZStack {
            HStack {
                Text("\(notice.icon) \(notice.description)")
                    .font(.custom("Poppins-Medium", size: 9))
                    .padding(.vertical, 4)
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemBackground))
            .clipShape(Capsule())
        }
    }
}

#Preview {
    CarouselView()
}
