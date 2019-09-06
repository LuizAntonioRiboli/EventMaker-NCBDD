//
//  AskForNameViewController.swift
//  EventMaker
//
//  Created by Luiz Pedro Franciscatto Guerra on 04/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class AskForNameViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var participateButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personalizeScreen()
    }
    
    func personalizeScreen () {
        // Mark: delegates
        self.nameTextField.delegate = self
        // Mark: Beautify screen
        self.headerView.addShadowToView()
        self.nameView.roundCorners(radius: 9)
        self.nameView.addShadowToView()
        self.participateButton.circlefy()
        // Mark: Dismiss keyboard gestures
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
    }
    
    override func viewDidLayoutSubviews() {
        var contentRect = CGRect.zero
        for view in scrollContentView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    @objc func dismissKeyboard () {
        self.view.endEditing(true)
    }
    
    func handleButtonActivation (activeButton: Bool) {
        self.participateButton.isEnabled = activeButton
        self.participateButton.backgroundColor = activeButton ? ApplicationsColors.VividBlue : ApplicationsColors.VividBlueDisabled
    }
    
    @IBAction func backScreenButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func participateButtonAction(_ sender: Any) {
        let signInStoryboard = UIStoryboard(name: "fake3", bundle: nil)
        let signInVC = signInStoryboard.instantiateViewController(withIdentifier: "EventDetails") as! EventDetailsViewController
        self.present(signInVC, animated: true, completion: nil)
    }
    
}

extension AskForNameViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        handleButtonActivation(activeButton: textField.text != "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handleButtonActivation(activeButton: textField.text != "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
}
