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
    @State private var markets: Markets = []
    @State private var searchedItems: [Market] = []
    
    var filteredItems: [Market] {
        if searchText.isEmpty {
            return markets
        } else {
            return markets.filter { market in
                market.englishName.contains(searchText)
            }
        }
    }
    
    //MARK: - Body
    
    var body: some View {
        NavigationWrapper {
            List {
                ForEach(searchedItems, id: \.self) { item in
//                        CoinRowView(item: item)
                    NavigationLink {
                        NavigationLazyView(build: MarketDetailView(market: item))
                    } label: {
                        MarketRowView(item: item)
                    }
                }
            }
            
            .navigationTitle("Search")
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                if !searchText.isEmpty {
                    if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
                        searchedItems = markets
                    } else {
                        searchedItems = searchedItems.filter { $0.englishName.contains(searchText) }
                    }
                }
            }
        }
        
        .task {
            let result = try? await UpbitAPI.fetchAllMarket2()
            
            if let safeData = result {
                self.markets = safeData
                self.searchedItems = safeData
            }
        }
    }
}

#Preview {
    SearchView()
}

struct MarketDetailView: View {
    
    var market: Market
    
    var body: some View {
        Text(market.koreanName)
    }
}

struct MarketRowView: View {
    
    var item: Market
    
    @State private var like = false
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.green)
                    .background(.yellow)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(item.englishName)
                    Text(item.market)
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    like.toggle()
                }, label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.black)
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
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
                    Image(systemName: item.like ? "heart.fill" : "heart")
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
