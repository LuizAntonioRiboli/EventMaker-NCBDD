//
//  EventService.swift
//  EventMaker
//
//  Created by Anderson Lentz on 02/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

final class EventService{
    
    static let shared = EventService()
    
    // MARK: - Firebase Firestore References

    let EVENTS_DB_REF = Firestore.firestore().collection("events")
    
    private init(){}
    
    func getEvent(id: String, completion: @escaping(Event?) -> Void) -> Void {
 
        let tasksReference = Firestore.firestore().collection("events")

        tasksReference.document(id).getDocument { (snapshot, err) in
            if let data = snapshot?.data(){
                
                let event = Event(eventInfo: data)
                
                print(data)
                completion(event)
                
            }
        }
        

    }
}
