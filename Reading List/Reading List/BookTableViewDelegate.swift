//
//  BookTableViewDelegate.swift
//  Reading List
//
//  Created by Wesley Ryan on 3/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
