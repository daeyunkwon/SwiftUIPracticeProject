//
//  FirstView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/2/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("launch", bundle: nil)
                Spacer()
                Image("launchImage", bundle: nil)
                Spacer()
                Spacer()
                NavigationLink {
                    SecondView()
                } label: {
                    Text("시작하기")
                        .asRediusBlueBackground()
                }
            }
            .padding()
            .navigationTitle("")
            
        }
        .tint(.black)
    }
}

#Preview {
    FirstView()
}
