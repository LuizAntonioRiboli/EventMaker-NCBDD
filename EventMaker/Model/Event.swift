//
//  Event.swift
//  EventMaker
//
//  Created by Anderson Lentz on 02/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

class Event {

    enum EventKeys {
        static let address = "address"
        static let creator = "creator"
        static let date = "date"
        static let description = "description"
        static let isSharedPrice = "isSharedPrice"
        static let name = "name"
        static let participants = "participants"
        static let price = "price"
    }

    var address: String
    var creator: String
    var date: Int
    var description: String
    var isSharedPrice: Bool
    var name: String
    var participants: [Int: String]
    var price: Double
    
    init?(eventInfo: [String: Any]) {
        
        guard let address       = eventInfo[EventKeys.address] as? String,
              let creator       = eventInfo[EventKeys.creator] as? String,
              let date          = eventInfo[EventKeys.date] as? Int,
              let description   = eventInfo[EventKeys.description] as? String,
              let isSharedPrice = eventInfo[EventKeys.isSharedPrice] as? Bool,
              let name          = eventInfo[EventKeys.name] as? String,
              let participants  = eventInfo[EventKeys.participants] as? [Int: String],
              let price         = eventInfo[EventKeys.price] as? Double else { return nil }
        
        self.address = address
        self.creator = creator
        self.date = date
        self.description = description
        self.isSharedPrice = isSharedPrice
        self.name = name
        self.participants = participants
        self.price = price
    }

}
