//
//  ServiceListViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 5..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class ServiceListViewController: UITableViewController {
    
    var branch:Branch?
    
    override func viewDidLoad() {
        self.title = branch?.name
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = branch?.services?.count else {
            return 0
        }
        return rowCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ServiceCell", forIndexPath: indexPath)
        
        guard let service = branch?.services?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = service.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MeetingRoomSegue" {
            guard let destination = segue.destinationViewController as? MeetingRoomsListController, selectedIndex = self.tableView.indexPathForSelectedRow?.row , service = branch?.services?[selectedIndex] else {
                return
            }
            destination.service = service
        }
    }
}
