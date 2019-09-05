
//
//  EventMakeSpec.swift
//  EventMakerTests
//
//  Created by Raul Rodrigues on 9/4/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Quick
import Nimble
@testable import EventMaker

class EventMakeSpec: QuickSpec {
    
    override func spec() {
        var events: EventDatabase!
        
        beforeEach {
            events = EventDatabase(database: EventServiceTest.shared)
        }
        
        describe("Tendo que eu ainda não tenha criado o evento do churrasco,") {
            context("quando eu criar o evento do churrasco") {
                it("entao o evento deve estar na base de dados.") {
                    let event = Event(address: "",
                                      creator: "",
                                      date: "",
                                      hour: "",
                                      description: "Churrasco",
                                      isSharedPrice: false,
                                      name: "",
                                      participants: [],
                                      price: 0)
                    try! events.database.addEvent(event: event) { (id) in
                        events.database.getAllEvent { (array) in
                            expect(array).to(contain(event))
                        }
                    }
                }
            }
        }
        
        describe("Tendo que eu já tenha criado o evento da canção") {
            context("quando eu requisitar o evento da canção do servidor") {
                it("entao o evento deve ser retornado na requisição.") {
                    events.database.getEvent(id: "wePMWXk8drRVDjxaVUmk") { (event) in
                        expect(event).toNot(beNil())
                    }
                }
                
                it("entao o nome do evento deve ser \"Ir para A Casa\"") {
                    events.database.getEvent(id: "BCQeBZE9e3Im5PUPM6va") { (event) in
                        expect(event?.name).to(equal("Ir para A Casa"))
                    }
                }
            }
        }
        
        
        
        
    }
    
    
}


