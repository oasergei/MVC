//
//  NetworkService.swift
//  MVC-N
//
//  Created by Sergey on 20.05.18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

class NetworkService {
    
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                    print("NetworkService.swift is OK!")
                }
                
            } catch {
                print("NetworkService.swift is NOT OK!")
                print(error)
            }
        }.resume()
    }
}
