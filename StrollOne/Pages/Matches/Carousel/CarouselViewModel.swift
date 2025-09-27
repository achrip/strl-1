//
//  CarouselViewModel.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//
import Foundation

internal class CarouselViewModel: ObservableObject {
    @Published var recentMoves: [YourTurnCard]
    
    init() {
        self.recentMoves = [
            .init(sender: User(name: "Amanda", age: 22),
                  caption: "What is your favorite childhood memory?",
                 isHidden: true,
                  notice: .none,
                  image: "Amanda"),
            .init(sender: User(name: "Malte", age: 22),
                  caption: "What is the most important quality in friendships to you?",
                 isHidden: true,
                  notice: .announcement,
                  image: "Malte"),
            .init(sender: User(name: "Binghan", age: 28),
                  caption: "If you could choose to have one superpower, what would it be?",
                 isHidden: false,
                  notice: .none,
                  image: "Binghan")
        ]
    }
    
    init(recentMoves: [YourTurnCard]) {
        self.recentMoves = recentMoves
    }
    
    func onCardTap(_ card: inout YourTurnCard) {
        if card.isHidden {
            card.isHidden.toggle()
        }
    }
}

struct YourTurnCard: Identifiable {
    let id: UUID = UUID()
    let sender: User
    let caption: String
    var isHidden: Bool
    let notice: NoticeType
    let image: String
}

enum NoticeType: CaseIterable {
    case warning, info, announcement, none
    
    var description: String {
        switch self {
        case .announcement: return "They made a move!"
        case .info: return "They made a move!"
        case .warning: return "They made a move!"
        case .none: return ""
        }
    }
    
    var icon: String {
        switch self {
        case .announcement: return "📣"
        case .info: return "💡"
        case .warning: return "⚠️"
        case .none: return ""
        }
        
    }
    
}
