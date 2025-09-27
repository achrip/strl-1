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
        ScrollView(.horizontal) {
            HStack {
                ForEach(vm.recentMoves, id: \.id) { card in
                    makeCard(card)
                }
            }
        }
        .scrollIndicators(.hidden)
//        .fixedSize()
        .padding(.horizontal)
        .frame(height: UIScreen.main.bounds.height * 0.30)
    }
}

extension CarouselView {
    @ViewBuilder
    func makeCard(_ card: YourTurnCard) -> some View {
        let screen = UIScreen.main.bounds
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
                    .padding(.top, 1)
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
