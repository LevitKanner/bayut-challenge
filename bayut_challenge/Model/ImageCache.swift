//
//  ImageCache.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import Foundation
import UIKit

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    func get(forkey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forkey))
    }
    func set(forkey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forkey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
