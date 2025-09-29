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
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(.clear)
            .environment(\.defaultMinListRowHeight, 0)
            .padding(.top, 6)
            .padding(.horizontal, 6)
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
                        .font(.proximaNova(forTextStyle: .title2, weight: .bold))
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
                        .font(.proximaNova(forTextStyle: .title2, weight: .bold))
                        .foregroundStyle(.gray)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 10)
            
            Text("The ice is broken. Time to hit it off")
                .font(.proximaNova(forTextStyle: .footnote, weight: .thin))
                .foregroundStyle(Color("Secondary"))
                .fontWeight(.light)
                .italic()
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func makeListItem(_ chat: Chat) -> some View {
        let screen = UIScreen.main.bounds
        HStack(alignment: .top) {
            Image(chat.sender.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen.width * 0.137, height: screen.height * 0.064)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(chat.sender.name)
                        .font(.proximaNova(forTextStyle: .headline, weight: .bold))
                    
                    makeChatTag(chat.status)
                }
                
                if !chat.preview.isEmpty {
                    Text(chat.preview)
                        .font(.proximaNova(forTextStyle: .subheadline, weight: chat.status != .yourTurn ? .regular : .semibold))
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
                    .font(.proximaNova(forTextStyle: .headline, weight: .bold))
                    .foregroundStyle(Color("ReadPreviewText"))
                    .offset(y: 5)
                }
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(chat.time)
                    .font(.proximaNova(forTextStyle: .footnote, weight: .semibold))
                    .foregroundStyle(chat.status == .none ? Color("ReadText") : Color("UnreadText"))
                
                if chat.isStarred {
                    makeFavoriteNotificationBadge()
                } else if chat.unreadMessagesCount > 1 {
                    makeChatNotificationBadge(with: chat.unreadMessagesCount)
                }
                
                Spacer()
            }
        }
        .padding(.vertical, 4)
        .background(
            Group {
                if chat.preview.isEmpty {
                    GeometryReader { proxy in
                        Image("Aurora")
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .top)
                            .clipped()
                            .opacity(0.3)
                            .blur(radius: 10)
                            .mask(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: .clear, location: 0.0),
                                        .init(color: .clear, location: 0.56),
                                        .init(color: .black.opacity(0.3), location: 0.6),
                                        .init(color: .black, location: 1.0)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    }
                }
            }
        )
    }
    
    @ViewBuilder
    func makeFavoriteNotificationBadge() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 20, height: 14)
                .foregroundStyle(Color("ChatNotification"))
            
            Text("★")
                .font(.proximaNova(forTextStyle: .caption1, weight: .bold))
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
                .font(.proximaNova(forTextStyle: .caption1, weight: .bold))
                .foregroundStyle(Color.black)
        }
    }
    
    @ViewBuilder
    func makeChatTag(_ tag: ChatTag) -> some View {
        let font = UIFont.proximaNova(forTextStyle: .caption1, weight: .semibold)
        if tag != .none {
            HStack(spacing: 6) {
                if tag == .newChat {
                    Circle()
                        .frame(width: font.pointSize * 0.5, height: font.pointSize * 0.5)
                        .foregroundStyle(Color("ChatTagText"))
                        .padding(.leading, 8)
                    
                    Text(tag.description)
                        .font(.proximaNova(forTextStyle: .caption1, weight: .semibold))
                        .foregroundStyle(Color("ChatTagText"))
                        .padding(.vertical, 2)
                        .padding(.trailing, 8)
                } else {
                    Text(tag.description)
                        .font(.proximaNova(forTextStyle: .caption1, weight: .semibold))
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
