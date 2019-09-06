//
//  EventDetailsViewController.swift
//  EventMaker
//
//  Created by Luiz Pedro Franciscatto Guerra on 05/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    // Mark: Header back button
    @IBOutlet weak var backButton: UIButton!
    // Mark:
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
        // Mark: Confirmation interaction
        @IBOutlet weak var confirmationBoxView: UIView!
        @IBOutlet weak var confirmationLabel: UILabel!
        @IBOutlet weak var confirmationHeightLayout: NSLayoutConstraint!
    // Mark: Event image
        @IBOutlet weak var eventImage: UIImageView!
        // Mark: Participating box
        @IBOutlet weak var participatingBox: UIView!
            @IBOutlet weak var participatingLabel: UILabel!
            @IBOutlet weak var participatingHeightLayout: NSLayoutConstraint!
        // Mark: General information
        @IBOutlet weak var eventTitle: UILabel!
        @IBOutlet weak var eventTime: UILabel!
        @IBOutlet weak var address: UILabel!
        @IBOutlet weak var price: UILabel!
        @IBOutlet weak var createdBy: UILabel!
        @IBOutlet weak var eventDescription: UILabel!
        // Mark: Cancell and share interactions
        @IBOutlet weak var cancelConfirmationButton: UIButton!
        @IBOutlet weak var eventCodeBox: UIView!
            @IBOutlet weak var eventCode: UILabel!
            @IBOutlet weak var copyEventCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personalizeScreen()
        animateEventParticipation()
        
    }
    
    func animateEventParticipation () {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            UIView.animate(withDuration: 1, animations: {
                self.confirmationHeightLayout.constant = 0
                self.view.layoutIfNeeded()
            })
        })
    }
    
    func personalizeScreen () {
        self.participatingBox.roundCorners(radius: 3)
        self.participatingBox.layer.borderColor = ApplicationsColors.green?.cgColor
        self.participatingBox.layer.borderWidth = 1
        self.cancelConfirmationButton.circlefy()
        self.cancelConfirmationButton.layer.borderWidth = 1.5
        self.cancelConfirmationButton.layer.borderColor = ApplicationsColors.red?.cgColor
        self.eventCodeBox.roundCorners(radius: 9)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        var contentRect = CGRect.zero
        for view in scrollContentView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
}

// Mark: Data setters
extension EventDetailsViewController {
    
    func setData (image: UIImage, address: String, value: CGFloat, creator: String, eventCode: String) {
        self.eventImage.image = image
        self.address.text = address
        self.price.text = "R$ \(value)"
        self.createdBy.text = creator
        self.eventCode.text = eventCode
    }
    
    func setData (imageData: Data, address: String, value: CGFloat, creator: String, eventCode: String) {
        self.eventImage.image = UIImage(data: imageData)
        self.address.text = address
        self.price.text = "R$ \(value)"
        self.createdBy.text = creator
        self.eventCode.text = eventCode
    }
    
    func setData (imageName: String, address: String, value: CGFloat, creator: String, eventCode: String) {
        self.eventImage.image = UIImage(named: imageName)
        self.address.text = address
        self.price.text = "R$ \(value)"
        self.createdBy.text = creator
        self.eventCode.text = eventCode
    }
    
}
