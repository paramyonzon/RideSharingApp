//
//  ContainerVC.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/22/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case collapsed
    case leftPanelExpanded
}

enum ShowWhichVC {
    case homeVC
}
    
var showVC: ShowWhichVC = .homeVC

class ContainerVC: UIViewController {
    
    var homeVC: HomeVC!
    var leftVC: LeftSidePanelVC!
    var centerController: UIViewController!
    var currentState: SlideOutState = .collapsed
    
    var isHidden = false
    let centerPanelOffset: CGFloat = 160
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCenter(screen: showVC)
    }

    func initCenter(screen: ShowWhichVC ) {
        var presentingController: UIViewController
        
        showVC = screen
        
        if homeVC == nil {
            homeVC = UIStoryboard.homeVC()
            homeVC.delegate = self
        }
        
        presentingController = homeVC
        
        if let con = centerController {
            
            con.view.removeFromSuperview()
            con.removeFromParentViewController()
            
        }
        
        centerController = homeVC
        
        if let con = presentingController
        
        view.addSubView(centerController.view)
        addChildSideViewController(centerController)
        centerController.didMove(toParentViewController: self)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    override var preferredStatusBarHidden: Bool {
        return isHidden
    }
}

extension ContainerVC: CenterVCDelegte {
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        if leftVC == nil {
            leftVC = UIStoryboard.leftviewController()
            addChildSideViewController(leftVC!)
        }
    }
    
    func addChildSideViewController( sidePanelController: LeftSidePanelVC) {
        view.insertSubview(sidePanelController.view, at: 0)
        addChildSideViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            isHidden = !isHidden
            animateStatusBar()
            
            hideWhiteCoverView()
            setupWhiteCoverView()
            
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targePosition: centerController.view.width - centerPanelOffset)
        } else {
            isHidden = !isHidden
            animateStatusBar()
            
            hideWhiteCoverView()
            animateCenterPanelXPosition(targePosition: 0, completion: { (finished) in
                if finished = true
                    self.currentState = .collapsed
                    self.leftVC = nil
                }
            })
        }
    }
    
    func animateCenterPanelXPosition(targePosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }

    func setupWhiteCoverView() {
        let whiteCoverView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        whiteCoverView.alpha = 0.0
        whiteCoverView.backgroundColor = UIColor.white
        whiteCoverView.tag = 25
        
}

        
        
        
    }

    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarApperanceUpdate()
        })
}

private extension UIStoryboard {
    class func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    class func leftviewController() -> LeftSidePanelVC? {
        return mainStoryBoard().instantiateViewController(withIdentifier: "LeftSidePanelVC") as? LeftSidePanelVC
    }
    
    class func HomeVC() -> HomeVC? {
        return mainStoryBoard().instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
    }
    
}
    
