//
//  LoremPicsumAPI.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/4/24.
//

import Foundation

enum LoremPicsumNetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse(statusCode: Int)
}

struct LoremPicsumAPI {
    private init() { }
    
    static func fetchImage() async throws -> Data {
        
        guard let url = URL(string: "https://picsum.photos/200/300") else {
            throw LoremPicsumNetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw LoremPicsumNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }
        
        return data
    }
    
    static func fetchImage(completion: @escaping (Data) -> Void) {
        
        let url = URL(string: "https://picsum.photos/200/300")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            completion(data)
        }.resume()
    }
}
