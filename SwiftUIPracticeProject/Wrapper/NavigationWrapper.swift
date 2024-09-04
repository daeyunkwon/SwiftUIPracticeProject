//
//  NavigationWrapper.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/4/24.
//

import SwiftUI

struct NavigationWrapper<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
    }
}
