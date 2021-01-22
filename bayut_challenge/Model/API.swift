//
//  API.swift
//  bayut_challenge
//
//  Created by Levit Kanner on 21/01/2021.
//

import Foundation

class API {
    static var shared = API()
    
    func fetchData(closure: @escaping (Listings) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer")!) { (data, res, err) in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode(Listings.self, from: data!)
                DispatchQueue.main.async {
                    closure(data)
                }
            }catch {
                debugPrint(error)
            }
        }
        task.resume()
        
    }
}
