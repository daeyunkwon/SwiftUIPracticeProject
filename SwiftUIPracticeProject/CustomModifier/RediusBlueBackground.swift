//
//  RediusBlueBackground.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/2/24.
//

import SwiftUI

struct RediusBlueBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
        .foregroundStyle(.white)
        .bold()
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue, in: Capsule(style: .circular))
    }
}

extension View {
    func asRediusBlueBackground() -> some View {
        return modifier(RediusBlueBackground())
    }
}
