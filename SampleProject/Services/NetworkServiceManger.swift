//
//  NetworkServiceManger.swift
//  SampleProject
//
//  Created by Arpit Verma on 12/15/25.
//

import Foundation
import UIKit


let data = """
[
  {
    "title": "Sample Item 1",
    "description": "This is a sample description for item number 1. It contains general information about the content and purpose of this particular entry in the JSON list.",
    "image": {
      "url": "https://picsum.photos/id/1/600/400",
      "type": "image"
    }
  }
]
"""


enum NetworkErrors :  Error {
    case badURL
    case wrongFormat
}


class NetworkService {
    
    static let shared  = NetworkService ()
    
    private init () {}
    
    
    func fetchUsers () async throws -> [UserModal] {
        let jsonData = try loadJSONData()
        return try JSONDecoder().decode([UserModal].self, from: jsonData)
        
    }
    
    /// Loads JSON either from a bundled file (jsonData.json) or from an asset catalog entry named "jsonData".
    private func loadJSONData() throws -> Data {
        if let url = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
            return try Data(contentsOf: url)
        }
        
        if let asset = NSDataAsset(name: "jsonData") {
            return asset.data
        }
        
        throw NetworkErrors.badURL
    }
    
    
}
