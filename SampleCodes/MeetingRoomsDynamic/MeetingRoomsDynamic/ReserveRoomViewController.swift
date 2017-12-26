//
//  ReserveRoomViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 17..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class ReserveRoomViewController: UITableViewController {

    //var reservation:Reservation?
    
    @IBOutlet weak var hostNameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var attendeesField: UITextField!
    @IBOutlet weak var equipmentsField: UITextField!
    @IBOutlet weak var cateringSwitch: UISwitch!
    
    
    
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

    @IBAction func makeReservation(sender: Any) {
        guard let reservation = makeReservation() else {
            self.dismiss(animated: true, completion: {
            })
            return
        }
        
        switch self.presentingViewController {
        case let tabBarC as UITabBarController:
            if let navigationC = tabBarC.selectedViewController as? UINavigationController, let reservationListVC = navigationC.topViewController as? ReservationListViewController {
                reservationListVC.addNewItem(reservation: reservation)
            }
        case let navigationC as UINavigationController:
            if let reservationListVC = navigationC.topViewController as? ReservationListViewController {
                reservationListVC.addNewItem(reservation: reservation)
            }
        case let reservationListVC as ReservationListViewController:
            reservationListVC.addNewItem(reservation: reservation)
        default:
            print("Cannot find ReservationListViewController")
            break
        }
        
        self.dismiss(animated: true, completion: {
        })
        
    }
    
    
    @IBAction func cancelReservation(sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReserveDone" {
            guard let newReservation = makeReservation(), let reservationListVC = segue.destination as? ReservationListViewController else {
                return
            }
            reservationListVC.addNewItem(reservation: newReservation)
        }
    }

    func makeReservation() -> Reservation? {
        let newReservation = Reservation()
        print("makeREservationRun")
        let host = hostNameField.text!
        if host.isEmpty {
            return nil
        }
        newReservation.hostName = host
        newReservation.date = datePicker.date as NSDate
        if let equipmentArray = equipmentsField.text?.characters.split(separator:",").map(String.init) {
            newReservation.equipments = equipmentArray
        }
        newReservation.catering = cateringSwitch.isOn
        return newReservation
    }
}
