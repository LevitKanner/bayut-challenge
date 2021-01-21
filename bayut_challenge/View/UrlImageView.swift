//
//  UrlImageView.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UIImage(named: "certificate")!)
            .resizable()
            .scaledToFill()
    }
}



