
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

class EventMakerSpec: QuickSpec {
    
    override func spec() {
        
  
        var events: EventDatabase!
        
        beforeEach {
            events = EventDatabase(database: EventServiceTest.shared)
        }
        
        // --------------------------------------------------------------------
        // MARK: - UI Tests
        // --------------------------------------------------------------------
//        
//        describe("Quando na tela de criação de evento") { // GIVEN
//            var createEventController: CreateEventViewController!
//            
//            beforeEach {
//                //Arrange:
//                let storyboard = UIStoryboard(name: "CreateEventStoryboard", bundle: .main)
//                createEventController = storyboard.instantiateInitialViewController() as? CreateEventViewController
//                let window = UIWindow(frame: UIScreen.main.bounds)
//                window.makeKeyAndVisible()
//                window.rootViewController = createEventController
//                
//                
//                //Act:
//                createEventController.beginAppearanceTransition(true, animated: true)
//            }
//            
//            context("e nenhum compo do formulario for preenchido") { // WHEN
//                it("todos os campos devem estar em branco.") { // THEN
//                    expect(createEventController.nameTextField.text).to(equal(""))
//                    expect(createEventController.creatorsNameTextField.text).to(equal(""))
//                    expect(createEventController.dataTextField.text).to(equal(""))
//                    expect(createEventController.hourTextField.text).to(equal(""))
//                    expect(createEventController.localAdressTextField.text).to(equal(""))
//                    expect(createEventController.priceTextField.text).to(equal(""))
//                }
//            }
//            
//            context("e eu clicar no botao de salvar evento") {
//                //Arrange
//                createEventController.firebase = events
//                createEventController.nameTextField.text = "Churrasco"
//                createEventController.creatorsNameTextField.text = "Raul"
//                createEventController.dataTextField.text = ""
//                createEventController.hourTextField.text = ""
//                createEventController.localAdressTextField.text = ""
//                createEventController.priceTextField.text = ""
//                createEventController.descriptionTextField.text = ""
//                
//                
//                it("o evento deve estar no banco de dados") {
//                    //Act
//                    createEventController.createEvent.sendActions(for: .touchUpInside)
//                    
//                    
//                    
//                    //Assert
//                    let event = Event(address: "",
//                                      creator: "Raul",
//                                      date: "",
//                                      hour: "",
//                                      description: "",
//                                      isSharedPrice: true,
//                                      name: "Churrasco",
//                                      participants: [],
//                                      price: nil)
//                    sleep(5)
//                    events.database.getAllEvent { (array) in
//                        expect(array).to(contain(event))
//                    }
//                }
//            }
//        }
//        
        // --------------------------------------------------------------------
        // MARK: - Code tests
        // --------------------------------------------------------------------
        
        
        
        
        
        describe("Tendo que eu ainda não tenha criado o evento do churrasco,") {
            
            context("quando eu criar o evento do churrasco") {
                let event = Event(address: "",
                                  creator: "",
                                  date: "",
                                  hour: "",
                                  description: "Churrasco",
                                  isSharedPrice: false,
                                  name: "",
                                  participants: [],
                                  price: 0)
                
                it("entao o evento deve estar na base de dados.") {
                    
                    events.database.addEvent(event: event) { (id) in
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


