//
//  Item.swift
//  Memorize
//
//  Created by João Víctor Benetti Filipim on 28/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
