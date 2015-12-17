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
        guard let sourceCurrecy = Currency(rawValue:currencySegment.selectedSegmentIndex) else {
            print("Source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "Error"
            return
        }
        let sourceMoney = Money(sourceAmount, currency: sourceCurrecy)
        
        var targetMoneyString = ""
        for (var i=0 ; i < 4 ; i++){
            targetMoneyString += sourceMoney.valueInCurrency(Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyString
    }

}

