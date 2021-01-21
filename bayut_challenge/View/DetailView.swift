//
//  DetailView.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import SwiftUI

let large = UIScreen.main.bounds.height > 800
struct DetailView: View {
    let listing: Listing
    
    var body: some View {
        VStack{
            UrlImageView(urlString: listing.imageUrls.first!)
                .frame(maxWidth: large ? 330 : 300, maxHeight: 500, alignment: .center)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
            
            Spacer().frame(maxHeight: 20)
            
            VStack(alignment: .center){
                Text(listing.name)
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(.black)
                    .padding(.top , 10)
                
                Text(listing.price)
                    .font(.custom("AvenirNext-bold", size: 18))
                    .foregroundColor(.gray)
            }
            
            Spacer().frame(maxHeight: 20)
            
            VStack(alignment: .leading, spacing: 10){
                Button {
                    
                } label: {
                    Text("BOOKMARK")
                        .foregroundColor(.black)
                        .font(.custom("AvenirNext-Regular" , size: 16))
                        .fontWeight(.bold)
                        .lineLimit(nil)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 53)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                }
                
                
                Button {
                    
                } label: {
                    Text("ADD TO CART")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular" , size: 16))
                        .fontWeight(.bold)
                        .lineLimit(nil)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50)
                        .background(Color.black.cornerRadius(10))
                }
                
                
            }
            .padding(.bottom)
            
        }
        .padding(.horizontal, 5)
    }
}
