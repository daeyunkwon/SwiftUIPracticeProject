//
//  ProfileCircle.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/2/24.
//

import SwiftUI

struct ProfileCircle: View {
    
    @Binding var selectedImageName: String
    
    var body: some View {
        Image(selectedImageName, bundle: nil)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(content: {
                Circle()
                    .stroke(Color.blue, lineWidth: 4)
                
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.blue)
                    .clipShape(Circle())
                    .offset(CGSize(width: 35.0, height: 35.0))
                    
            })
    }
}

#Preview {
    ProfileCircle(selectedImageName: .constant("profile_0"))
}
