//
//  ViewController.swift
//  testUIAnimation
//
//  Created by Nguyen Duc Tai on 5/11/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloWorld: UILabel!
    @IBOutlet weak var hiddenLbl: UILabel!
    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // we add features view when everything view start appear onscreen
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 2) {
            self.helloWorld.center.y += self.view.bounds.height
            UIView.animate(withDuration: 2, delay: 1, options: [], animations: {
                self.lbl.center.y -= self.view.bounds.height
            }, completion: nil)
        }
        //// If you want have velocity and damping you can change by this:
        //        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
        //
        //        }, completion: nil)
    }
    // we add features view when everything onscreen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        hiddenLbl.alpha = 0
        
        UIView.animate(withDuration: 3, animations: {
            self.view.backgroundColor = UIColor.yellow
        }) { (finished) in
            UIView.animate(withDuration: 3, animations: {
                self.view.backgroundColor = UIColor.black
            })
        }
        
        UIView.animate(withDuration: 3, delay: 4, options: [], animations: {
            self.hiddenLbl.alpha = 1
        }) { (finished) in
            self.performSegue(withIdentifier: "segueVC2", sender: self)
        }
    }
}




