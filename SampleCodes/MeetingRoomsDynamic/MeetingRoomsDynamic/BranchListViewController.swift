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
}
