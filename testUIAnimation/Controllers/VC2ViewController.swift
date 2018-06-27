//
//  VC2ViewController.swift
//  testUIAnimation
//
//  Created by Nguyen Duc Tai on 5/11/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit

class VC2ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var centerXofLbl: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
//        lbl.center.x -= view.bounds.width
        centerXofLbl.constant -= view.bounds.width // dấu label "Welcome"
        view.layoutIfNeeded()
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, animations: {
            self.view.backgroundColor = UIColor.green
        }) { (finished) in
            UIView.animate(withDuration: 10, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options:.curveEaseInOut, animations: {
                self.centerXofLbl.constant += self.view.bounds.width // cho cái label "welcome" ra
                self.view.layoutIfNeeded()
            })
        }
        
    }
    // when you want have velocity and damp:
    @IBAction func pressedBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:.curveEaseInOut, animations: {
            self.btn.bounds.size.width += 20
            self.btn.bounds.size.height += 10
        }) { (finished) in
            self.btn.bounds.size.width -= 20
            self.btn.bounds.size.height -= 10
        }
    }
}
