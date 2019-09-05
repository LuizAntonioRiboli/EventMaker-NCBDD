//
//  EventMakerUITests.swift
//  EventMakerUITests
//
//  Created by Raul Rodrigues on 9/3/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import XCTest

import Quick
import Nimble

class UIEventMakerSpec: QuickSpec {
    override func spec() {
        
        let app = XCUIApplication()
        
        describe("TESTE") {
            context("TESTE") {
                
                app.buttons["CRIAR EVENTO"].tap()
                
                it("TESTE", closure: {
                    
                    expect(app.buttons.count).to(equal(2))
                    
                })
            }
        }
        
        
    }
}
