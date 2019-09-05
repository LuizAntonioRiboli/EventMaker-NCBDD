
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
        
        describe("Tendo que eu ainda não o evento") {
            context("quando eu criar o evento") {
                it("entao o evento deve estar do database.") {
                    let event = Event(address: "",
                                      creator: "",
                                      date: "",
                                      hour: "",
                                      description: "",
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
        
        describe("Tendo que eu já tenha criado o evento X") {
            context("quando eu requisitar o evento X do servidor") {
                it("entao o evento deve ser retornado na requisição.") {
                    events.database.getEvent(id: "wePMWXk8drRVDjxaVUmk") { (event) in
                        expect(event).toNot(beNil())
                    }
                }
            }
        }
        
        
        
        
    }
    
    
}


