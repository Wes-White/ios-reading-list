//
//  Book.swift
//  Reading List
//
//  Created by Wesley Ryan on 3/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Book: Codable, Equatable {
    let title: String
    let reasonToRead: String
    let hasBeenRead: Bool = false
}
