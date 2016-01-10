//
//  ViewController.swift
//  HelloiPhone
//
//  Created by Lingostar on 2015. 11. 2..
//  Copyright © 2015년 CodersHigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func change(sender: AnyObject) {
        myLabel.text = "Hello World"
    }
}

