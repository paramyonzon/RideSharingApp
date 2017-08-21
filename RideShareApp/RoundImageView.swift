//
//  RoundImageView.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/20/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit


class RoundImageView: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    

}

