//
//  MeetingRoomsListController.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 3. 13..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

/*
class MeetingRoomsListController: UITableViewController {

    //var meetingRooms:[String:Int] = ["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30, "Renoir":40]
    var meetingRooms:[String:[String:Int]] = ["Meeting":["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10], "Seminar":["Cezanne":20, "Matisse":30, "Renoir":40]]
    
    func meetingRoomsAtIndex(index:Int) -> (key:String, value:[String:Int]) {
        let orderedMeetingRooms = meetingRooms.sort({$0.1.first!.1 < $1.1.first!.1})
        return orderedMeetingRooms[index]
    }
    //Generic
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meetingRooms.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //let categoryValues = Array(meetingRooms.values)[section]
        
        //let orderedMeetingRooms = meetingRooms.sort({$0.1.first!.1 < $1.1.first!.1})
        
        //let rowCount = orderedMeetingRooms[section].1.count
        let rowCount = meetingRoomsAtIndex(section).value.count
        return rowCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)

        //let orderedMeetingRooms = meetingRooms.sort({$0.1.first!.1 < $1.1.first!.1})
        //let categoryValue = orderedMeetingRooms[indexPath.section].1
        let categoryValue = meetingRoomsAtIndex(indexPath.section).value
        
        let orderedCategoryValues = categoryValue.sort({$0.1 < $1.1})
        let roomName = orderedCategoryValues[indexPath.row].0
        let capacity = orderedCategoryValues[indexPath.row].1
        
        cell.textLabel!.text = roomName
        cell.detailTextLabel!.text = "\(capacity)"

        return cell
    }

    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return Array(meetingRooms.keys)[section]
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {

        let rowCount = Array(meetingRooms.values)[section].count
        
        return "\(rowCount) rooms"
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
 
 */


class MeetingRoomsListController: UITableViewController {
    var service:Service?
    
    override func viewDidLoad() {
        self.title = service?.name
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = service?.item?.count else {
            return 0
        }
        return rowCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
        
        guard let meetingRoom = service?.item?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = meetingRoom.name
        cell.detailTextLabel?.text = String(meetingRoom.capacity)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ReservationSegue" {
            guard let destination = segue.destinationViewController as? ReservationListViewController, selectedIndex = self.tableView.indexPathForSelectedRow?.row , meetingRoom = service?.item?[selectedIndex] else {
                return
            }
            destination.meetingRoom = meetingRoom
        }
    }
}


