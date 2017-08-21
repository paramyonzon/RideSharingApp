//
//  RoundedShadowView.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/21/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit

class RoundedShadowView: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }
    
}
