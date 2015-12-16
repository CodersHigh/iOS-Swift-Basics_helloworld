//
//  ViewController.swift
//  MoneyConverter
//
//  Created by Lingostar on 2015. 12. 16..
//  Copyright © 2015년 CodersHigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var currencySegment: UISegmentedControl!
    @IBOutlet weak var sourceMoneyField: UITextField!
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertMoney(sender: AnyObject) {
        let ratio:Double
        switch currencySegment.selectedSegmentIndex {
        case 0:
            ratio = 0.00085
        case 1:
            ratio = 1178.5
        default:
            ratio = 1.0
        }
        
        let targetMoneyString:String
        if let sourceMoney = Double(sourceMoneyField.text!) {
            targetMoneyString = "\(sourceMoney * ratio)"
        } else {
            targetMoneyString = "Error"
        }
        targetMoneyLabel.text = targetMoneyString
    }

}

