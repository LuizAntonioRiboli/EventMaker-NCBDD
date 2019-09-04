//
//  FiresabeDatabase.swift
//  EventMaker
//
//  Created by Raul Rodrigues on 9/4/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//∫

import Foundation

final class EventDatabase {
    var database: EventServiceProtocol
    
    init(database: EventServiceProtocol) {
        self.database = database
    }
}
