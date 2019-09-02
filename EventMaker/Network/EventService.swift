//
//  EventService.swift
//  EventMaker
//
//  Created by Anderson Lentz on 02/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation
import Firebase

final class EventService{
    
    static let shared = EventService()
    
    // MARK: - Firebase Database References
    let BASE_DB_REF = Database.database().reference()
    let EVENTS_DB_REF = Database.database().reference().child("events")
    
    private init(){}
    
    func getEvent(id: String, completion: @escaping(Event?) -> Void) -> Void {
        EVENTS_DB_REF.child(id).observeSingleEvent(of: .value, with: { snapshot in
            let event = snapshot.value as! [String: Any]
            print(event)
            let eventResult = Event(eventInfo: event)
            completion(eventResult)
        })
    }
}
