//
//  ViewForXib.swift
//  EventMaker
//
//  Created by Luiz Antonio Bolsoni Riboli on 04/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ViewForXib: UIView {

    @IBOutlet var xibView: UIView!
    @IBOutlet weak var xibImageView: UIImageView!
    
    @IBOutlet weak var xibEventNameLabel: UILabel!
    
    @IBOutlet weak var xibDateLabel: UILabel!
    
    @IBOutlet weak var xibTagLabel: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // Custom init
    private func commonInit(){
        Bundle.main.loadNibNamed("xibTableViewCell", owner: self, options: nil)
        addSubview(xibView)
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        xibTagLabel.layer.borderColor = UIColor.green.cgColor
        xibTagLabel.layer.borderWidth = 1

    }

}



