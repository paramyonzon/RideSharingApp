//
//  CircleView.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/21/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit

class CircleView: UIButton {
    
    @IBInspectable var BorderColor: UIColor? {
        didSet {
            setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = BorderColor?.cgColor
        
    }
    
}
