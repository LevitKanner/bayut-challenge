//
//  CardView.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import SwiftUI

struct CardView: View {
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading) {
            UrlImageView(urlString: listing.imageUrls.first!)
                .frame(width: large ? 180 : 130, height: 200, alignment: .center)
                .cornerRadius(10)
            
            Text(listing.price)
                .font(.custom("AvenirNext-Demibold", size: 14))
            
            Text(listing.name)
                .font(.custom("AvenirNext-Regular", size: 12))
                .foregroundColor(.secondary)
        }
    }
}
