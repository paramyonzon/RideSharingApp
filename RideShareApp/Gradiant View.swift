//
//  Gradiant View.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/20/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit

class Gradiant_View: UIButton {

    let gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        setupGradientView()
    }
    
    func setupGradientView() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint.init(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)

    }
}
