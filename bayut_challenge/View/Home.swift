//
//  Home.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import SwiftUI

struct Home: View {
    @State private var listings = [Listing]()
    
    var body: some View {
        
        NavigationView {
            VStack {
                //Welcome Text
                HStack{
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Let's")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        Text("Get Started")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    Spacer(minLength: 0)
                }
                .padding(.vertical, 5)
                
                //Scroll Content
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2), spacing: 25) {
                        ForEach(listings, id: \.id) { listing in
                            NavigationLink(destination: DetailView(listing: listing)) {
                                CardView(listing: listing)
                                    .padding(5)
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text("Bayut"), displayMode: .inline)
            .navigationBarItems(
                leading: Image(systemName: "line.horizontal.3.decrease")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.black)
                ,
                trailing: Image(systemName: "person")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.black)
                    .padding(4)
                    .background(Circle().foregroundColor(.secondary))
            )
        }
        .onAppear() {
            API.shared.fetchData {self.listings = $0.results}
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
