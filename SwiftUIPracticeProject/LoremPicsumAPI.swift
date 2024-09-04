//
//  LoremPicsumAPI.swift
//  SwiftUIPracticeProject
//
//  Created by 권대윤 on 9/4/24.
//

import Foundation

struct LoremPicsumAPI {
    private init() { }
    
    static func fetchImage() async throws -> Data {
        
        let url = URL(string: "https://picsum.photos/200/300")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode(Data.self, from: data)
        
        return decodedData
    }
    
    static func fetchImage(completion: @escaping (Data) -> Void) {
        
        let url = URL(string: "https://picsum.photos/200/300")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            completion(data)
        }.resume()
    }
}
