//
//  SearchView.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: - Properties
    
    @State private var searchText: String = ""
    @State private var items: [Coin] = coinDummy
    
    var filteredItems: [Coin] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { coin in
                coin.name.contains(searchText)
            }
        }
    }
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(filteredItems, id: \.id) {item in
                        CoinRowView(item: item)
                    }
                }
            }
            
            .navigationTitle("Search")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    SearchView()
}

struct CoinRowView: View {
    @ObservedObject var item: Coin
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .padding(6)
                    .background(.gray)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text(item.subName)
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    item.like.toggle()
                }, label: {
                    Image(systemName: item.like ? "star.fill" : "star")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.black)
                })
            }
            .overlay {
                Divider()
                    .background(.gray)
                    .offset(y: 35)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.vertical, 7)
        }
        .padding(.horizontal, 20)
    }
}
