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
                Image("launch0", bundle: nil)
                Spacer()
                Image("launchImage0", bundle: nil)
                Spacer()
                Spacer()
                NavigationLink {
                    NavigationLazyView(build: SecondView())
                } label: {
                    Text("시작하기")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
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

struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    
    init(build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
