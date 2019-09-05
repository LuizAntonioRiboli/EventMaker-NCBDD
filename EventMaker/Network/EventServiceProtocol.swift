//
//  EventServiceProtocol.swift
//  EventMaker
//
//  Created by Anderson Lentz on 02/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

protocol EventServiceProtocol {
    func getEvent(id: String, completion: @escaping(Event?) -> Void)
    func addEvent(event: Event, completion: @escaping (String?) -> Void) 
    func getAllEvent(completion: @escaping([Event]) -> Void)
}
