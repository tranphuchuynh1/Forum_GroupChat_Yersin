//
//  ChatView.swift
//  App_GroupChat_IOS
//
//  Created by Tran Phuc Huynh on 24/11/24.
//

import SwiftUI


@available(iOS 16.0, *)
struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = ""
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView(showsIndicators: false) {
                    VStack(spacing:8){
                        ForEach(Array(chatViewModel.messages.enumerated()), id: \.element ) { idx, message in
                            MessageView(message: message)
                                .id(idx)
                        }
                        .onChange(of: chatViewModel.messages) {
                            newValue in scrollView .scrollTo(chatViewModel.messages.count - 1, anchor: .bottom)
                        }
                    }
                }
            }
            HStack {
                TextField("Nhap tin nhan.......", text: $text,axis: .vertical)
                    .padding()
            ZStack {
                Button {
                    if text.count > 2 {
                        chatViewModel.sendMessage(text: text) { success in
                            if success {
                                
                            } else {
                                print("loi~ khi gui tin nhan")
                            }
                        }
                        text = ""
                    }
                } label: {
                    // css for button send o day nhe
                    Text("Send")
                        .padding()
                        .foregroundColor(Color.init(uiColor: .systemBackground)) // color text button
                        .background(.cyan)
                        .cornerRadius(50)
                        .padding(.trailing)
                    }
                }
            .padding(.top)
            .shadow(radius: 3)
                
            }
            .background(Color(uiColor:.systemGray6))
        }
    }
}


#Preview {
    if #available(iOS 16.0, *) {
        ChatView()
    } else {
        // Fallback on earlier versions
    }
}
