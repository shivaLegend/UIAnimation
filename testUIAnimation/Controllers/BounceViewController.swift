//
//  BounceViewController.swift
//  testUIAnimation
//
//  Created by Nguyen Duc Tai on 5/16/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit

class BounceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedBounce(_ sender: UIButton) {
        let bounds = sender.bounds
        // Option: CurveEaseInOut made the effort which start slow then fast then slow again
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            sender.bounds = CGRect(x: bounds.origin.x-20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                self.view.layoutIfNeeded()
        }) { (success: Bool) in
            if success {
                UIView.animate(withDuration: 0.5, animations: {
                    sender.bounds = bounds
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    

    
}
