//
//  UrlImageModel.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import Foundation
import SwiftUI

class UrlImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        if getImageFromCache() { return }
        loadImageFromUrl()
    }
    
    //Get image from cache
    func getImageFromCache() -> Bool {
        guard let urlString = urlString else { return false}
        guard let cacheImage = imageCache.get(forkey: urlString) else {return false}
        image = cacheImage
        return true
    }
    
    
    // Hit API to download image
    func loadImageFromUrl() {
        guard urlString != nil else {return}
        let url = URL(string: urlString!)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard err == nil else {
                print("Error: \(err!)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            DispatchQueue.main.async {
                guard let loadedImage = UIImage(data: data) else { return }
                self.imageCache.set(forkey: self.urlString!, image: loadedImage)
                self.image = loadedImage
            }
        }
        task.resume()
    }
}

