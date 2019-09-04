//
//  PostEventCreationViewController.swift
//  EventMaker
//
//  Created by Luiz Antonio Bolsoni Riboli on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class PostEventCreationViewController: UIViewController {

    
    @IBOutlet weak var eventCodeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view design customizations:
        eventCodeView.layer.cornerRadius = 10
        eventCodeView.layer.masksToBounds = false
        eventCodeView.layer.shadowColor = UIColor(red: 0.54, green: 0.54, blue: 0.54, alpha: 0.25).cgColor
        eventCodeView.layer.shadowOpacity = 1
        eventCodeView.layer.shadowOffset = CGSize(width: 0, height: 2.3)
        eventCodeView.layer.shadowRadius = 3
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
