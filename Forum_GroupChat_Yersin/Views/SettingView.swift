//
//  SettingView.swift
//  Forum_GroupChat_Yersin
//
//  Created by Huynh Trần on 12/28/24.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI



struct SettingView: View {
    @State private var showSignIn: Bool = false // Default value for showSignIn
    @State private var showSideMenu: Bool = false
    @State private var displayName: String = ""
    @State private var email: String = ""
    @State private var photoURL: URL? = nil
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                VStack {
                    // Your existing UI code remains the same
                    VStack {
                        // Header and other views
                    }
                    
                    // Nội dung chính
                    VStack(spacing: 20) {
                        ToggleRowView(title: "Thông báo tin nhắn", isOn: .constant(true))
                        ToggleRowView(title: "Chế độ sáng/tối", isOn: .constant(true))
                        ToggleRowView(title: "Âm thanh", isOn: .constant(true))
                        
                        Spacer()
                        
                        Button(action: {
                            // Thêm hành động đăng xuất
                            do {
                                try AuthManager.shared.signOut()
                                // Cập nhật trạng thái đăng nhập
                                showSignIn = true // Set showSignIn to true after logout
                            } catch {
                                print("logout lỗi")
                            }
                        }) {
                            Text("Đăng Xuất")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0.53, green: 0.13, blue: 0.11))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    
                    Spacer()
                }
                .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
            }
        }
        .onAppear {
            loadUserInfo()
        }
    }
    
    func loadUserInfo() {
        if let user = Auth.auth().currentUser {
            self.displayName = user.displayName ?? "No Name"
            self.email = user.email ?? "No Email"
            self.photoURL = user.photoURL
        }
    }
}

struct ToggleRowView: View {
    var title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView() // Now initializing with default value
    }
}


