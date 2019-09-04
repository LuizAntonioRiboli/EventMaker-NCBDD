//
//  EventServiceTest.swift
//  EventMakerTests
//
//  Created by Raul Rodrigues on 9/4/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation
@testable import EventMaker

final class EventServiceTest: EventServiceProtocol {
    private var events: [String : Event]
    
    static let shared = EventServiceTest()
    
    init() {
        events = [:]
        events.updateValue(Event(address: "Rua Carazinho 90",
                                 creator: "Marco de Vargas",
                                 date: 45355344,
                                 description: "O churras vai ser na churrascaria mais cara de porto ",
                                 isSharedPrice: true,
                                 name: "Churrasco",
                                 participants: ["Raul", "Anderson"],
                                 price: 5000.32), forKey: "wePMWXk8drRVDjxaVUmk")
        
        events.updateValue(Event(address: "Rua dos Bobos 0",
                                 creator: "Vinicius de Moraes",
                                 date: 45355344  *  2,
                                 description: "Não entrar, não dormir na rede, não fazer pipi",
                                 isSharedPrice: false,
                                 name: "Ir para A Casa",
                                 participants: ["Chumiga", "Ale Bing"],
                                 price: 0), forKey: "BCQeBZE9e3Im5PUPM6va")
    }
    
    func getEvent(id: String, completion: @escaping (Event?) -> Void) {
        completion(events[id])
    }
    
    func addEvent(event: Event, completion: @escaping (String?) -> Void) {
        let id = "\(Int.random(in: 0 ... 1000000000))"
        events.updateValue(event, forKey: id)
        completion(id)
    }
    
    func getAllEvent(completion: @escaping ([Event]) -> Void) {
        completion(events.map { $1 })
    }
}
