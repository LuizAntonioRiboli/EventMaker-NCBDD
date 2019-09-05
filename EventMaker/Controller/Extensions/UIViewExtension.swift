//
//  UIViewExte nsion.swift
//  EventMaker
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadowToView () {
        clipsToBounds = false
        layer.shadowOpacity = 0.5
        layer.shadowColor = (UIColor(named: "Gray 2") ?? UIColor.lightGray).cgColor
        layer.shadowRadius = 25
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    func circlefy () {
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func roundCorners (radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
}
