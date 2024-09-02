//
//  ThirdView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/2/24.
//

import SwiftUI

struct ThirdView: View {
    
    @Binding var selectedImageName: String
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    private let list = ["profile_0", "profile_1", "profile_2", "profile_3", "profile_4", "profile_5", "profile_6", "profile_7", "profile_8", "profile_9", "profile_10", "profile_11"]
    
    //MARK: - Body
    
    var body: some View {
        
        ProfileCircle(selectedImageName: $selectedImageName)
        
        Spacer()
        
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(list, id: \.self) { item in
                Button(action: {
                    selectedImageName = item
                }, label: {
                    profileCircleImage(name: item)
                })
            }
        }
        .padding()
        
        ForEach(0..<6) { item in
            Spacer()
        }
        
        .navigationTitle("PROFILE SETTING")
        .toolbarRole(.editor)
    }
    
    //MARK: - Methods
    
    func profileCircleImage(name: String) -> some View {
        var strokeSetting: (Color, Double)
        
        if selectedImageName == name {
            strokeSetting = (Color.blue, 3.0)
        } else {
            strokeSetting = (Color.gray, 1.0)
        }
        
        return Image(name, bundle: nil)
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(strokeSetting.0, lineWidth: strokeSetting.1)
            }
            .opacity(selectedImageName == name ? 1.0 : 0.6)
    }
}

#Preview {
    ThirdView(selectedImageName: .constant("profile_0"))
}
