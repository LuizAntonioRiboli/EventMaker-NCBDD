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

final class EventServiceFirebase: EventServiceProtocol {
    func addEvent(event: Event, completion: @escaping (String?) -> Void) {
        do {
            let data = try event.asDictionary()
            
            eventsReference.addDocument(data: data).addSnapshotListener { (snapshot, error) in
                
                if let eventID = snapshot?.documentID {
                    let userDefault = UserDefaults.standard
                    
                    if var array = userDefault.array(forKey: "UserEventsArray") as? [String] {
                        array.append(eventID)
                        userDefault.set(array, forKey: "UserEventsArray")
                    } else {
                        var newArray = [eventID]
                        userDefault.set(newArray, forKey: "UserEventsArray")
                    }
                    
                    completion(eventID)
                }
            }
            
        } catch {
            print(error.localizedDescription)
            completion(nil)
        }
    }
    
    static let shared = EventServiceFirebase()
    
    // MARK: - Firebase Firestore References
    let eventsReference = Firestore.firestore().collection("events")
    
    private init(){}
    
    //MARK: - EventServiceProtocol
    func getEvent(id: String, completion: @escaping(Event?) -> Void) -> Void {
 
        
        print("getEvent \(id)")
        eventsReference.document(id).getDocument { (snapshot, err) in
            
            
            if err != nil{
                completion(nil)
                return
            }else{
                
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
                else{
                    print("no data")
                    completion(nil)
                }
            }
        }
    }
    
    func getAllEvent(completion: @escaping ([Event]) -> Void) {
        
        var events:[Event] = []

        let userDefault = UserDefaults.standard
        
        if let array = userDefault.array(forKey: "UserEventsArray") as? [String] {
            
            print(array)
            
            let group = DispatchGroup()
            
            for eventID in array {
                
                print("Entrou grupo")
                group.enter()
                
                getEvent(id: eventID) {(eventResult) in
                    print("events: \(eventResult)")
                    print(eventResult?.name)
                    if let result = eventResult{
                        events.append(result)
                    }
                    print("saindo grupo")
                    print(events)
                    group.leave()
                }
            }
            group.notify(queue: DispatchQueue.main){
                print(events)
                completion(events)
            }
        }else {
            completion(events)
        }
    }
}
