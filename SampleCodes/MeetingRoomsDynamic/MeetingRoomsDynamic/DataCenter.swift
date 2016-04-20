//
//  DataCenter.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 5..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import Foundation

let dataCenter:DataCenter = DataCenter()

class DataCenter {
    var branches:[Branch] = []
    
    init() {
        
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
        
        branches += [samsungBranch, pangyoBranch, yeoksamBranch, sinrimBranch, songdoBranch, anamBranch]
    }
}


class Branch {
    let name:String
    var services:[Service]?
    
    init(name:String) {
        self.name = name
    }
}


class Service {
    let name:String
    var item:[MeetingRoom]?
    
    init (name:String){
        self.name = name
    }
}


class MeetingRoom {
    let name:String
    let capacity:Int
    var reservations:[Reservation]?
    init(name:String, capacity:Int) {
        self.name = name
        self.capacity = capacity
    }
}



class Reservation {
    var hostName:String
    var date:NSDate
    var attendees:Int
    var equipments:[String]
    var catering:Bool
    
    init (){
        self.hostName = "Host of meeting"
        self.date = NSDate()
        self.attendees = 1
        self.equipments = []
        self.catering = false
    }
}

