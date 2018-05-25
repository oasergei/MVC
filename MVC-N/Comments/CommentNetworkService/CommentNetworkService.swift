//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Sergey on 20.05.18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

class CommentNetworkService {
    private init() {}
    
    static func getComments(completion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/post/1/comments") else { return }
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
