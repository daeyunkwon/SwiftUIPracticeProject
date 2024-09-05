//
//  CategoryView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/4/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    let id = UUID().uuidString
    let name: String
    let count: Int
    
    var titleAndCountString: String {
        return "\(name)(\(count))"
    }
}

struct CategoryView: View {
    
    @State private var categorys: [Category] = []
    @State private var searchText = ""
    private let item = ["SF", "가족", "스릴러"]
    
    private var filtered: [Category] {
        return searchText.isEmpty ? categorys : categorys.filter { $0.name.contains(searchText) }
    }
    
    var body: some View {
        NavigationWrapper {
            List(filtered, id: \.id) { item in
                rowView(category: item)
            }
            
            .navigationTitle("영화 검색")
            .navigationBar(leading: {
                EmptyView()
            }, trailing: {
                Button(action: {
                    let data = Category(name: item.randomElement() ?? "NONE", count: .random(in: 1...100))
                    self.categorys.append(data)
                }, label: {
                    Text("추가")
                })
            })
        }
        .searchable(text: $searchText, prompt: "영화를 검색해보세요.")
    }
    
    private func rowView(category: Category) -> some View {
        HStack {
            Image(systemName: "person")
            NavigationLink(category.titleAndCountString) {
                NavigationLazyView(build: CategoryDetailView(data: category))
            }
        }
    }
}

#Preview {
    CategoryView()
}

struct CategoryDetailView: View {
    
    let data: Category
    
    var body: some View {
        Text(data.name)
            .font(.title)
            .bold()
        
        Text("\(data.count)")
    }
}
