//
//  MyRandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/4/24.
//

import SwiftUI

struct MyRandomImageView: View {
    
    @State private var sections = ["첫번째 섹션", "두번째 섹션", "세번째 섹션", "네번째 섹션"]
    @State private var imageDatas: [[UIImage]] = Array(repeating: [], count: 4)
    
    
    //MARK: - Body
    
    var body: some View {
        NavigationWrapper {
            Spacer()
            ScrollView {
                VStack {
                    ForEach($sections.indices, id: \.self) { index in
                        sectionRowView(sectionTitle: $sections[index], sectionIndex: index)
                    }
                }
            }
            .navigationTitle("My Random Image")
            .refreshable {
                for i in 0..<4 {
                    for j in 0..<5 {
                        LoremPicsumAPI.fetchImage { data in
                            imageDatas[i][j] = UIImage(data: data)!
                        }
                    }
                }
            }
        }
        
        .task {
            for i in 0..<4 {
                for _ in 0..<5 {
//                    LoremPicsumAPI.fetchImage { data in
//                        imageDatas[i].append(UIImage(data: data)!)
//                    }
                    Task {
                        do {
                            let result = try await LoremPicsumAPI.fetchImage()
                            imageDatas[i].append(UIImage(data: result) ?? UIImage())
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
    }
    
    //MARK: - Methods
    
    private func sectionRowView(sectionTitle: Binding<String>, sectionIndex: Int) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(sectionTitle.wrappedValue)
                .font(.system(size: 20))
                .bold()
                .padding(.leading, 20)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(imageDatas[sectionIndex], id: \.self) { item in
                        
                        NavigationLink {
                            MyRandomImageDetailView(sectionTitle: sectionTitle, imageData: item)
                        } label: {
                            ImageThumbnail(imageData: item)
                        }
                        
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            .frame(height: 150)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    MyRandomImageView()
}

struct MyRandomImageDetailView: View {
    
    @Binding var sectionTitle: String
    let imageData: UIImage
    
    var body: some View {
        
        Image(uiImage: imageData)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        
        TextField("섹션 제목 입력..", text: $sectionTitle)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 44)
                    
            }
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct ImageThumbnail: View {
    let imageData: UIImage
    
    var body: some View {
        Image(uiImage: imageData)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}


