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
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return documentDirectory + fileName
    }}
    
    init() {
        if FileManager.default.fileExists(atPath: self.filePath) {
            //read
            if let unarchArray = NSKeyedUnarchiver.unarchiveObject(withFile: self.filePath) as? [Branch] {
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
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.services = aDecoder.decodeObject(forKey: "services") as? [Service]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.services, forKey: "services")
    }
}


class Service:NSObject, NSCoding {
    let name:String
    var item:[MeetingRoom]?
    
    init (name:String){
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.item = aDecoder.decodeObject(forKey: "item") as? [MeetingRoom]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.item, forKey: "item")
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
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.capacity = aDecoder.decodeInteger(forKey: "capacity")
        self.reservations = aDecoder.decodeObject(forKey: "reservations") as? [Reservation]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.capacity, forKey: "capacity")
        aCoder.encode(self.reservations, forKey: "reservations")
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
        self.hostName = aDecoder.decodeObject(forKey: "hostName") as! String
        self.date = aDecoder.decodeObject(forKey: "date") as! NSDate
        self.attendees = aDecoder.decodeInteger(forKey: "attendees")
        self.equipments = aDecoder.decodeObject(forKey: "equipments") as! [String]
        self.catering = aDecoder.decodeBool(forKey: "catering")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.hostName, forKey: "hostName")
        aCoder.encode(self.date, forKey: "date")
        aCoder.encode(self.attendees, forKey: "attendees")
        aCoder.encode(self.equipments, forKey: "equipments")
        aCoder.encode(self.catering, forKey: "catering")
    }
}

