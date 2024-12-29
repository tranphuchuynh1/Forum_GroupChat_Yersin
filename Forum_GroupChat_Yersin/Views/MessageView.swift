//
//  MessageView.swift
//  App_GroupChat_IOS
//
//  Created by Tran Phuc Huynh on 24/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageView: View {
    var message: Message
    
    
    var body: some View {
        if !message.isFromCurrentUser(){
            HStack {
                HStack{
                    Text(message.text)
                        .padding()
                        .background(Color.init(uiColor: .systemBackground)) // mau` backgr cua~ text cua minh khi chat
                        .cornerRadius(20)
                }
                .frame(maxWidth: 260,alignment: .trailing)
                
                if let photoURL = message.fetchPhotoURL() {
                    WebImage(url: photoURL)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 38,maxHeight: 38,alignment: .top)
                        .cornerRadius(16)
                        .padding(.bottom,19)
                        .padding(.leading,4)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 38,maxHeight: 38,alignment: .top)
                        .cornerRadius(16)
                        .padding(.bottom,19)
                        .padding(.leading,4)
                        .foregroundColor(.gray)
                }
                
                    
            }
            .frame(maxWidth: .infinity,alignment: .trailing)
            .padding(.trailing)
        } else{
            HStack {
                if let photoURL = message.fetchPhotoURL() {
                    WebImage(url: photoURL)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 38,maxHeight: 38,alignment: .top)
                        .cornerRadius(16)
                        .padding(.bottom,19)
                        .padding(.leading,4)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 38,maxHeight: 38,alignment: .top)
                        .cornerRadius(16)
                        .padding(.bottom,19)
                        .padding(.leading,4)
                        .foregroundColor(.gray)
                }
                
                HStack{
                    Text(message.text)
                        .padding()
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(20)
                }
                .frame(maxWidth: 260,alignment: .leading)
                
            }
            .frame(maxWidth: .infinity,alignment: .leading) // day ra sat duong` vien
            .padding(.leading)
        }
        
    }
}

#Preview {
    MessageView(message: Message(userUid: "123", text: "hi mn minh la huynh, hom nay minh code ", photoURL: "", createdAt: Date()))
    
}
