//
//  ChatViewModel.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 28/09/25.
//

import Foundation

internal class ChatViewModel: ObservableObject {
    @Published var chats: [Chat]
    @Published var activeTab: ChatTab = .chats
    
    init() {
        self.chats = [
            .init(sender: .init(name: "Jessica", age: 21), status: .newChat, unreadMessagesCount: 1, time: "6:21pm", isStarred: true, preview: ""),
            .init(sender: .init(name: "Amanda", age: 22), status: .yourTurn, unreadMessagesCount: 1, time: "6:21pm", isStarred: false, preview: "Lol I love house music too"),
            .init(sender: .init(name: "Sila", age: 25), status: .none, unreadMessagesCount: 0, time: "Wed", isStarred: false, preview: "You: I love the people there tbh, have you been?"),
            .init(sender: .init(name: "Marie", age: 28), status: .yourTurn, unreadMessagesCount: 4, time: "6:21pm", isStarred: false, preview: "Hahaha that's interesting, it does seem like the people here are starting to love house music more"),
            .init(sender: .init(name: "Jessica", age: 24), status: .yourTurn, unreadMessagesCount: 1, time: "6:21pm", isStarred: false, preview: "")
        ]
    }
}

enum ChatTab {
    case chats, pending
}

struct Message: Identifiable {
    var id: UUID = UUID()
    var sender: User
    var time: Date
    var text: String
}

struct Chat: Identifiable {
    var id: UUID = UUID()
    var sender: User
    var status: ChatTag
    var unreadMessagesCount: Int
    var time: String
    var isStarred: Bool
    var preview: String
}

enum ChatTag: CaseIterable {
    case newChat, yourTurn, none
    
    var description: String {
        switch self {
        case .newChat: return "New chat"
        case .yourTurn: return "Your move"
        case .none: return ""
        }
    }
}
