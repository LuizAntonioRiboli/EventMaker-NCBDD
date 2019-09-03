//
//  ViewController.swift
//  EventMaker
//
//  Created by Raul Rodrigues on 9/2/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        EventService.shared.getEvent(id: "wePMWXk8drRVDjxaVUmk", completion: { data in
            print("recebeu")
            print(data?.address)
        })
        // Do any additional setup after loading the view.
    }


}

