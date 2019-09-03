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

final class EventService: EventServiceProtocol{
    
    static let shared = EventService()
    
    // MARK: - Firebase Firestore References
    let eventsReference = Firestore.firestore().collection("events")
    
    private init(){}
    
    //MARK: - EventServiceProtocol
    func getEvent(id: String, completion: @escaping(Event?) -> Void) -> Void {
 
        eventsReference.document(id).getDocument { (snapshot, err) in
            
            
            if let data = snapshot?.data(){

                do{
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options:[])
                    let event = try JSONDecoder().decode(Event.self, from: jsonData)
                
                    completion(event)
                }catch{
                    print("\(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
        

    }
}
