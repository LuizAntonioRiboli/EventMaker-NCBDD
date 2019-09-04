//
//  CreateEventViewController.swift
//  EventMaker
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ParticipateEventViewController: UIViewController {
    
    // Mark: Header
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    // Mark: ScrollView
    @IBOutlet weak var scrollView: UIScrollView!
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
        personalizeScreen()
    }
    
    func personalizeScreen () {
        self.headerView.addShadowToView()
        self.eventImage.circlefy()
        self.keyView.addShadowToView()
        self.keyView.roundCorners(radius: 9)
        self.nextButton.circlefy()
        self.nextButton.isEnabled = false
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
        self.keyTextField.delegate = self

    }
    
    func handleButtonActivation (activeButton: Bool) {
        self.nextButton.isEnabled = activeButton
        self.nextButton.backgroundColor = activeButton ? ApplicationsColors.VividBlue : ApplicationsColors.VividBlueDisabled
    }
    
    @objc func dismissKeyboard () {
        self.view.endEditing(true)
    }

    @IBAction func nextButtonAction(_ sender: Any) {
        // perform action
    }
    
}

extension ParticipateEventViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        handleButtonActivation(activeButton: textField.text == "" ? false : true )
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handleButtonActivation(activeButton: textField.text == "" ? false : true )
    }
    
}
