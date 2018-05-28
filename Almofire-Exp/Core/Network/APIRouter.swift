//
//  APIRouter.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 28/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import Foundation
import Alamofire


enum PostEndpoint: APIConfiguration {
    
    case posts
    case comments(postId: Int)
    
     var path: String {
        switch self {
        case .posts:
            return "/posts"
        case .comments:
            return "/comments"
        }
    }
    
     var method: HTTPMethod {
        switch self {
        case .posts, .comments:
            return .get
        }
    }
    
     var parameters: Parameters? {
        switch self {
        case .posts, .comments:
            return nil
        }
    }
    
    var queryParam: [URLQueryItem]? {
        switch self {
        case .comments(let postId):
            return [URLQueryItem.init(name: K.APIParameterKey.postId, value: String(postId))]
        case .posts:
            return nil
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        
        
        let baseURL = try K.ProductionSrver.basePath.asURL()
        var urlComponent = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        
        if let queryParams = queryParam {
            urlComponent?.queryItems = queryParams
        }
        
        var urlRequest = URLRequest(url: (urlComponent?.url)!)
        
        //Common headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderKey.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderKey.contentType.rawValue)
        
        //Method
        urlRequest.httpMethod = method.rawValue
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
        
    }
}


