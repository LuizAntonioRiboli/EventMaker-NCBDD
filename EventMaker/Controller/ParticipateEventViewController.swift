//
//  CreateEventViewController.swift
//  EventMaker
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ParticipateEventViewController: UIViewController {
    
    // Marker: Header
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var eventImage: UIView!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var joinEventTitle: UILabel!
    
    
    @IBOutlet weak var askForKeyLabel: UILabel!
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var keyTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func personalizeScreen () {
        self.headerView.addShadowToView()
        self.eventImage.circlefy()
        self.keyView.addShadowToView()
        self.keyView.roundCorners(radius: 9)
        self.nextButton.circlefy()
        self.nextButton.isEnabled = false
    }
    
    func handleButtonActivation () {
        if self.nextButton.isEnabled {
           self.nextButton.isEnabled = false
            self.nextButton.backgroundColor = ApplicationsColors.VividBlueDisabled
        } else {
            self.nextButton.isEnabled = true
            self.nextButton.backgroundColor = ApplicationsColors.VividBlue
        }
    }

}
