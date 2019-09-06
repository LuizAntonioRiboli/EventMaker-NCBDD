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
        //Mark: Fixed Content
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var eventImage: UIView!
        @IBOutlet weak var number: UILabel!
        @IBOutlet weak var joinEventTitle: UILabel!
        @IBOutlet weak var askForKeyLabel: UILabel!
        @IBOutlet weak var keyView: UIView!
            @IBOutlet weak var keyTextField: UITextField!
        @IBOutlet weak var nextButton: UIButton!
        // Mark: Child Content
        @IBOutlet weak var correspondentEvent: UIView!
        @IBOutlet weak var correspondentEventHeightConstraint: NSLayoutConstraint!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personalizeScreen()
    }
    
    override func viewDidLayoutSubviews() {
        var contentRect = CGRect.zero
        for view in scrollContentView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    private func personalizeScreen () {
        // Mark: Delegates
        self.keyTextField.delegate = self
        // Mark: Beautify screen
        self.headerView.addShadowToView()
        self.keyView.addShadowToView()
        self.keyView.roundCorners(radius: 9)
        self.nextButton.circlefy()
        self.nextButton.isEnabled = false
        // Mark: Dismiss keyboard gestures
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Mark: Remove container view
        self.correspondentEvent.isHidden = true
        self.correspondentEventHeightConstraint.constant = 0
        // Mark: Tab bar icon
//        tabBarController?.tabBar.items?.last?.image = #imageLiteral(resourceName: "ic_participar")
    }
    
    func handleButtonActivation (activeButton: Bool) {
        self.nextButton.isEnabled = activeButton
        self.nextButton.backgroundColor = activeButton ? ApplicationsColors.VividBlue : ApplicationsColors.VividBlueDisabled
    }
    
    @objc func dismissKeyboard () {
        self.view.endEditing(true)
    }

    @IBAction func nextButtonAction(_ sender: Any) {
        if self.correspondentEventHeightConstraint.constant == 143 {
            
            let signInStoryboard = UIStoryboard(name: "fake3", bundle: nil)
            let signInVC = signInStoryboard.instantiateViewController(withIdentifier: "AskForName") as! AskForNameViewController
            self.present(signInVC, animated: true, completion: nil)
            self.tabBarController?.performSegue(withIdentifier: "AskForName", sender: self)
        }
        self.correspondentEvent.isHidden = false
        UIView.animate(withDuration: 1, animations: {
            self.correspondentEventHeightConstraint.constant = 143
            self.view.layoutIfNeeded()
        })
    }
    
}

extension ParticipateEventViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        handleButtonActivation(activeButton: textField.text != "" )
        self.correspondentEventHeightConstraint.constant = 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handleButtonActivation(activeButton: textField.text != "" )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
}

class EventContainerView: UIViewController {
    
    @IBOutlet weak var eventCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventCell.roundCorners(radius: 9)
    }
    
}
