//
//  Listing.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import Foundation
import UIKit

struct Listing: Codable, Identifiable{
    let price, name, id: String
//    let createdAt: String
//    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]
    
    enum CodingKeys: String, CodingKey {
//        case createdAt = "created_at"
        case id = "uid"
        case price, name
//        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

struct Listings: Codable {
    let results: [Listing]
}

