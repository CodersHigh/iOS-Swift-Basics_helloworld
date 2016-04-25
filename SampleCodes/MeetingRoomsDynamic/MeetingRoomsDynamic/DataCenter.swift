//
//  DataCenter.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 5..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import Foundation

let dataCenter:DataCenter = DataCenter()
let fileName = "BranchData.brch"

class DataCenter {
    var branches:[Branch] = []
    
    var filePath:String { get{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        return documentDirectory + fileName
    }}
    
    init() {
        if NSFileManager.defaultManager().fileExistsAtPath(self.filePath) {
            //read
            if let unarchArray = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath) as? [Branch] {
                branches += unarchArray
            }
        } else {
            //create
            branches += defaultData()
        }
        
        
    }
    
    func defaultData() -> Array<Branch> {
        let banksyRoom = MeetingRoom(name: "Banksy", capacity: 4)
        let kahloRoom = MeetingRoom(name: "Kahlo", capacity: 8)
        let riveraRoom = MeetingRoom(name: "Rivera", capacity: 8)
        let picassoRoom = MeetingRoom(name: "Picasso", capacity: 10)
        
        
        let vehicleService = Service(name: "차량예약")
        let meetingRoomService = Service(name: "회의실예약")
        let visitorService = Service(name: "방문자예약")
        let deskService = Service(name: "데스크예약")
        meetingRoomService.item = [banksyRoom, kahloRoom, riveraRoom, picassoRoom]
        
        let pangyoBranch = Branch(name: "판교점")
        let samsungBranch = Branch(name: "삼성점")
        let yeoksamBranch = Branch(name: "역삼점")
        let sinrimBranch = Branch(name: "신림점")
        let songdoBranch = Branch(name: "송도점")
        let anamBranch = Branch(name: "안암점")
        pangyoBranch.services = [vehicleService, meetingRoomService, visitorService, deskService]
        
        let branchArray = [samsungBranch, pangyoBranch, yeoksamBranch, sinrimBranch, songdoBranch, anamBranch]
        return branchArray
    }
    
    func save(){
        NSKeyedArchiver.archiveRootObject(self.branches, toFile: self.filePath)
    }
}


class Branch:NSObject, NSCoding {
    let name:String
    var services:[Service]?
    
    init(name:String) {
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.services = aDecoder.decodeObjectForKey("services") as? [Service]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.services, forKey: "services")
    }
}


class Service:NSObject, NSCoding {
    let name:String
    var item:[MeetingRoom]?
    
    init (name:String){
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.item = aDecoder.decodeObjectForKey("item") as? [MeetingRoom]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.item, forKey: "item")
    }
    
}


class MeetingRoom:NSObject, NSCoding {
    let name:String
    let capacity:Int
    var reservations:[Reservation]?
    
    init(name:String, capacity:Int) {
        self.name = name
        self.capacity = capacity
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.capacity = aDecoder.decodeIntegerForKey("capacity")
        self.reservations = aDecoder.decodeObjectForKey("reservations") as? [Reservation]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.capacity, forKey: "capacity")
        aCoder.encodeObject(self.reservations, forKey: "reservations")
    }
}



class Reservation:NSObject, NSCoding {
    var hostName:String
    var date:NSDate
    var attendees:Int
    var equipments:[String]
    var catering:Bool
    
    override init() {
        self.hostName = "Host of meeting"
        self.date = NSDate()
        self.attendees = 1
        self.equipments = []
        self.catering = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.hostName = aDecoder.decodeObjectForKey("hostName") as! String
        self.date = aDecoder.decodeObjectForKey("date") as! NSDate
        self.attendees = aDecoder.decodeIntegerForKey("attendees")
        self.equipments = aDecoder.decodeObjectForKey("equipments") as! [String]
        self.catering = aDecoder.decodeBoolForKey("catering")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.hostName, forKey: "hostName")
        aCoder.encodeObject(self.date, forKey: "date")
        aCoder.encodeInteger(self.attendees, forKey: "attendees")
        aCoder.encodeObject(self.equipments, forKey: "equipments")
        aCoder.encodeBool(self.catering, forKey: "catering")
    }
}

