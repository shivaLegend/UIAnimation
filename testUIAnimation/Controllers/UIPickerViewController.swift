//
//  UIPickerViewController.swift
//  testUIAnimation
//
//  Created by Nguyen Duc Tai on 5/16/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit

class UIPickerViewController: UIViewController {
    
    var array = ["🍏","🍎","🍌","🌽","🍗","⚽️","🏀","🏈","⚾️","🎾"]
    
    var component1 = [Int]()
    
    var component2 = [Int]()
    
    var component3 = [Int]()
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1..<100 {
            component1.append(randomNumber(num: 10))
            component1.append(randomNumber(num: 10))
            component1.append(randomNumber(num: 10))
        }
    }
    
    func randomNumber(num: Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    @IBAction func pressedPlay(_ sender: UIButton) {
        
        pickerView.selectRow(self.randomNumber(num: 10), inComponent: 0, animated: true)
        pickerView.selectRow(self.randomNumber(num: 10), inComponent: 1, animated: true)
        pickerView.selectRow(self.randomNumber(num: 10), inComponent: 2, animated: true)
        
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
extension UIPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.text = array[component1[row]]
        //random emoji
        
        pickerLabel.font = UIFont(name: "Color Emoji", size: 80)
        
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
}
