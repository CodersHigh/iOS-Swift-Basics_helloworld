//
//  TintColorViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 20..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

enum TintColor:Int {
    case Blue=0, Red, Green, Purple
    
    var color:UIColor {get{
        switch self {
        case .Blue:
            return UIColor.blueColor()
        case .Red:
            return UIColor.redColor()
        case .Green:
            return UIColor.greenColor()
        case .Purple:
            return UIColor.purpleColor()
        }
    }}
}
let TintColorKey = "TintColor"

func applyTintColor(color:UIColor){
    guard let window = UIApplication.sharedApplication().keyWindow else {
        return
    }
    window.tintColor = color
}

class TintColorViewController: UIViewController {

    @IBOutlet weak var tintColorSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let userDefaultColor = NSUserDefaults.standardUserDefaults().integerForKey(TintColorKey)
        self.tintColorSegment.selectedSegmentIndex = userDefaultColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tintColorChanged(sender: AnyObject) {
        let selectedIndex = self.tintColorSegment.selectedSegmentIndex
        NSUserDefaults.standardUserDefaults().setInteger(selectedIndex, forKey: TintColorKey)
        guard let changedColor = TintColor(rawValue: selectedIndex)?.color else {
            return
        }
        applyTintColor(changedColor)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
