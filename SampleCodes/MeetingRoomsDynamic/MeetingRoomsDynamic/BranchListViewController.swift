//
//  BranchListViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 5..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class BranchListViewController: UITableViewController {

    override func viewDidLoad() {
        self.title = "지점"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowCount = dataCenter.branches.count
        return rowCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BranchCell", forIndexPath: indexPath)
        
        let branch = dataCenter.branches[indexPath.row]
        cell.textLabel?.text = branch.name
        return cell
    }
    
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ServiceSegue" {
            if let destination = segue.destinationViewController as? ServiceListViewController {
                if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.branch = dataCenter.branches[selectedIndex] as Branch
                }
                
            }
        }
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ServiceSegue" {
            guard let destination = segue.destinationViewController as? ServiceListViewController, selectedIndex = self.tableView.indexPathForSelectedRow?.row else {
                return
            }
            destination.branch = dataCenter.branches[selectedIndex] as Branch
        }
    }
    @IBAction func locationTurnOn(sender: AnyObject) {
        
        let locationAlert = UIAlertController(title: "위치 정보 요청", message: "위치 정보를 기반으로 가까운 지점을 자동으로 선택할 수 있습니다. 또는 지도앱에서 지점의 위치 정보를 제공해 드립니다. 선택하신 기능이 계속 제공됩니다. 환경설정에서 제공되는 기능을 변경할 수 있습니다.", preferredStyle: .ActionSheet)
        let locationAction = UIAlertAction(title: "위치정보 켜기", style: .Default, handler: { (action:UIAlertAction) -> Void in
            print ("위치정보 켜기 선택")
            })
        let openMapAction = UIAlertAction(title: "지도앱에서 열기", style: .Default, handler: { (action:UIAlertAction) -> Void in
            print ("지도앱에서 열기 선택")
        })
        
        locationAlert.addAction(locationAction)
        locationAlert.addAction(openMapAction)
        self.presentViewController(locationAlert, animated: true, completion: nil)
    }
}
