//
//  Bundle-Decodable.swift
//  AppleDeveloper (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 17/04/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = Bundle.main.decode("landmarkData.json")
    var hikes: [Hike] = Bundle.main.decode("hikeData.json");
    @Published var profile = Profile.default
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks, by: {$0.category.rawValue}
        )
    }
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}
extension Bundle {
    //Generic Types <T> or anything we can write instead of T
    func decode<T: Codable>(_ file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
