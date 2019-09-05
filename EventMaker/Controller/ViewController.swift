//
//  ViewController.swift
//  EventMaker
//
//  Created by Raul Rodrigues on 9/2/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firebase: EventDatabase?

    override func viewDidLoad() {
        super.viewDidLoad()
        firebase = EventDatabase(database: EventServiceFirebase.shared)
        guard let firebase = firebase else { fatalError() }
        
        firebase.database.getEvent(id: "wePMWXk8drRVDjxaVUmk") { data in
            print("recebeu")
            print(data?.address)
        }
        
        
       
    }
}

