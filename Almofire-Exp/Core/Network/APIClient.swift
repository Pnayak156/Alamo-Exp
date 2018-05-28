//
//  APIClient.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 28/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    
    static func performRequest<T: Codable>(urlRequest: URLRequestConvertible, completion: @escaping (Result<T>) -> Void) {
        request(urlRequest).responseJSON { response in
            do {
                let result = try JSONDecoder().decode(T.self, from: response.data!)
                completion(Result.success(result))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
    
    static func posts(completion: @escaping (Result<[Post]>) -> Void) {
        performRequest(urlRequest: PostEndpoint.posts, completion: completion)
    }
    
    static func comments(postId: Int, completion: @escaping (Result<[Comment]>) -> Void) {
        performRequest(urlRequest: PostEndpoint.comments(postId: postId), completion: completion)
    }
    
}
