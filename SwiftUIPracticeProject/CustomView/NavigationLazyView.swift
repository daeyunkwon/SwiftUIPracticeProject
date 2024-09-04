//
//  NavigationLazyView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/4/24.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    
    init(build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
