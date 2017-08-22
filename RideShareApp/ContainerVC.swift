//
//  ContainerVC.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/22/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit
import QuartzCore

class ContainerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

private extension UIStoryboard {
    class func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    class func leftviewController() -> LeftSidePanelVC? {
        return mainStoryBoard().instantiateViewController(withIdentifier: "LeftSidePanelVC") as? LeftSidePanelVC
        
    }
}
    
