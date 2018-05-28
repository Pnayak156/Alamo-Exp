//
//  Comment.swift
//  Almofire-Exp
//
//  Created by Prashanta Kumar Nayak on 28/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
