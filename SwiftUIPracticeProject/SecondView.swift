//
//  SecondView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/2/24.
//

import SwiftUI

struct SecondView: View {
    
    @State private var navigationTitle = "PROFILE SETTING"
    @State private var selectedImageName = "profile_0"
    @State private var nicknameText = ""
    @State private var isSheet = false
    @State private var pushToThirdView = false
    
    
    //MARK: - Body
    
    var body: some View {
        Spacer()
        VStack {
            NavigationLink {
                NavigationLazyView(build: ThirdView(selectedImageName: $selectedImageName))
            } label: {
                ProfileCircle(selectedImageName: $selectedImageName)
            }

            nicknameTextField()
            
            Spacer()
            
            HStack(alignment: .top) {
                Text("MBTI")
                    .font(.system(size: 17))
                    .bold()
                
                ForEach(0..<6) { item in
                    Spacer()
                }
                
                VStack(spacing: 10) {
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "E")
                    })
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "I")
                    })
                }
                
                VStack(spacing: 10) {
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "S")
                    })
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "N")
                    })
                }
                
                VStack(spacing: 10) {
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "T")
                    })
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "F")
                    })
                }
                
                VStack(spacing: 10) {
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "J")
                    })
                    Button(action: {
                        print("탭탭")
                    }, label: {
                        mbtiAlphabetCircle(word: "P")
                    })
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            ForEach(0..<5) { item in
                Spacer()
            }
            
            Button(action: {
                self.isSheet.toggle()
            }, label: {
                Text("완료")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .asRediusBlueBackground()
                    .frame(maxWidth: .infinity)
                    .padding()
            })
        }
        
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        
        .sheet(isPresented: $isSheet, content: {
            FourthView()
        })
        .onDisappear(perform: {
            //navigationTitle = ""
        })
    }
    
    //MARK: - Methods
    
    func nicknameTextField() -> some View {
        ZStack(alignment: .leading) {
            if nicknameText.isEmpty {
                Text("닉네임을 입력해 주세요 :)")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.leading, 15)
            }
            TextField("", text: $nicknameText)
                .font(.system(size: 15))
                .overlay(content: {
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(.gray.opacity(0.5))
                        .offset(x: 0, y: 20.0)
                })
                .frame(maxWidth: .infinity)
                .padding()
        }
    }
    
    func mbtiAlphabetCircle(word: String) -> some View {
        Text(word)
            .frame(width: 10, height: 10)
            .font(.system(size: 13))
            .foregroundStyle(.gray)
            .padding()
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1.5)
            }
    }
}

#Preview {
    SecondView()
}
