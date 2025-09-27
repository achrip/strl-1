//
//  ChatView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 28/09/25.
//

import Foundation
import SwiftUI

struct ChatView: View {
    
    @ObservedObject var vm: ChatViewModel = .init()
    
    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
            List(vm.chats) { chat in
                makeListItem(chat)
            }
            .listStyle(.plain)
        }
    }
}

extension ChatView {
    @ViewBuilder
    func makeHeader() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 12) {
                Button {
                    vm.activeTab = .chats
                } label: {
                    Text("Chats")
                        .font(.title3)
                        .fontWeight(.bold)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .offset(y: 6),
                            alignment: .bottom
                        )
                        .opacity(vm.activeTab == .chats ? 1 : 0)
                }
                .buttonStyle(.plain)
                
                Button {
                    vm.activeTab = .pending
                } label: {
                    Text("Pending")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 10)
            
            Text("The ice is broken. Time to hit it off")
                .font(.caption)
                .foregroundStyle(Color("Secondary"))
                .fontWeight(.light)
                .italic()
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func makeListItem(_ chat: Chat) -> some View {
        HStack {
            Image(chat.sender.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 66, height: 66)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack {
                    Text(chat.sender.name)
                        .font(.body)
                        .fontWeight(.bold)
                    
                    makeChatTag(chat.status)
                }
                
                if !chat.preview.isEmpty {
                    Text(chat.preview)
                        .font(.subheadline)
                        .fontWeight(chat.status != .yourTurn ? .regular : .semibold)
                        .foregroundStyle(chat.status != .yourTurn ? Color("ReadPreviewText") : Color("UnreadPreviewText"))
                        .lineLimit(2)
                        .truncationMode(.tail)
                } else {
                    HStack(spacing: 6) {
                        Image(systemName: "mic.fill")
                            .foregroundStyle(Color("Voice"))
                        Image(systemName: "waveform")
                            .foregroundStyle(Color("Voice"))
                        Text("00:58")
                            .foregroundStyle(Color("Voice"))
                    }
                    .font(.headline)
                    .foregroundStyle(Color("ReadPreviewText"))
                }
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(chat.time)
                    .font(.caption)
                    .foregroundStyle(chat.status == .none ? Color("ReadText") : Color("UnreadText"))
                
                if chat.isStarred {
                    makeFavoriteNotificationBadge()
                } else if chat.unreadMessagesCount > 0 {
                    makeChatNotificationBadge(with: chat.unreadMessagesCount)
                }
                
                Spacer()
            }
            .padding(.top, 19)
        }
    }
    
    @ViewBuilder
    func makeFavoriteNotificationBadge() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 20, height: 14)
                .foregroundStyle(Color("ChatNotification"))
            
            Image(systemName: "star.fill")
                .font(.custom("Poppins-Medium", size: 10))
                .foregroundStyle(Color.black)
        }
    }
    @ViewBuilder
    func makeChatNotificationBadge(with count: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 20, height: 14)
                .foregroundStyle(Color("ChatNotification"))
            
            Text("\(count)")
                .font(.custom("Poppins-Medium", size: 10))
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
        }
    }
    
    @ViewBuilder
    func makeChatTag(_ tag: ChatTag) -> some View {
        if tag != .none {
            HStack {
                if tag == .newChat {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundStyle(Color("ChatTagText"))
                        .padding(.leading, 8)
                    
                    Text(tag.description)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("ChatTagText"))
                        .padding(.vertical, 2)
                        .padding(.trailing, 8)
                } else {
                    Text(tag.description)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("ChatTagText"))
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                }
                
            }
            .background(tag == .newChat ? Color("ChatTagPrimary") : Color("ChatTagSecondary"))
            .clipShape(Capsule())
            .padding(3)

        }
    }
}

#Preview {
    ChatView()
}
