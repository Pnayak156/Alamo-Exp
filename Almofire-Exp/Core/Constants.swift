//
//  Constants.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 28/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import Foundation

struct K {
    
    struct ProductionSrver {
        static let basePath = "https://jsonplaceholder.typicode.com"
    }
    
    struct APIParameterKey {
        static let postId = "postId"
    }
}

enum HTTPHeaderKey: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}


