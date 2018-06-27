//
//  VC3ViewController.swift
//  testUIAnimation
//
//  Created by Nguyen Duc Tai on 5/11/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit

class VC3ViewController: UIViewController {

    
    
    @IBOutlet weak var centerX: NSLayoutConstraint!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2) {
            self.view.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func pressedBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.img.bounds.size.height += 150
            self.img.bounds.size.width += 100
            self.view.layoutIfNeeded()
        }) { (finished) in
            UIView.animate(withDuration: 0.6, animations: {
                self.img.bounds.size.height -= 150
                self.img.bounds.size.width -= 100
                self.view.layoutIfNeeded()
            })
        }
    }
    

}
