//
//  UserModal.swift
//  SampleProject
//
//  Created by Arpit Verma on 12/15/25.
//

import Foundation


//{
//    "title": "Sample Item 1",
//    "description": "This is a sample description for item number 1. It contains general information about the content and purpose of this particular entry in the JSON list.",
//    "image": {
//      "url": "https://picsum.photos/id/1/600/400",
//      "type": "image"
//    }
//  },


struct UserModal: Identifiable, Codable {
    let id: UUID  = UUID()
    let title: String
    let description: String
    let image: ImageModal?

    init(id: UUID = UUID(),
         title: String,
         description: String,
         image: ImageModal?) {
        self.title = title
        self.description = description
        self.image = image
    }

    enum CodingKeys: String, CodingKey {
        case title, description, image
    }
}

struct ImageModal: Codable {
    let url: String
    let type: String?
}
