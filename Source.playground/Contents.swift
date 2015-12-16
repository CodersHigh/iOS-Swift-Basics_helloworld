//: Playground - noun: a place where people can play

import UIKit

// 프로토콜 방향으로 가면서
// 직원과 매니저의 프로토콜 설정.
struct Task {
    var title:String
    var time:Int?
    
    var owner:Employee
    //var participant:Employee?
    
    var type:TaskType
    
    enum TaskType {
        case Call(number:String)
        case Report(to:Employee, when:String)
        case Meet(with:Employee, location:String)
        case Support(who:Employee, duration:Int)
        
        var typeTitle:String {
            get {
                let titleString:String
                switch self {
                case .Call:
                    titleString = "Call"
                case .Report:
                    titleString = "Report"
                case .Meet:
                    titleString = "Meet"
                case .Support:
                    titleString = "Support"
                }
                return titleString
            }
        }
    }
    
    init (type:TaskType, owner:Employee) {
        self.type = type
        self.title = type.typeTitle
        self.owner = owner
        self.time = nil
        //self.participant = nil
    }
    
    func doBasicTask() -> String {
        let taskDescription:String
        switch type {
        case .Call(let number) :
            taskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time) :
            taskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Meet (let participant, let location):
            taskDescription = "\(owner.name) meet \(participant.name) at \(location)"
        case .Support(let taskOwner, let duration) :
            taskDescription = "\(owner.name) support \(taskOwner.name) for \(duration) days"
        default:
            taskDescription = "Need more information for task."
        }
        return taskDescription
    }
}

class Employee {
    var name:String
    var boss:Employee?
    var phoneNumber:String?
    
    init(name:String) {
        self.name = name
    }
    
    convenience init (name:String, phone:String){
        self.init(name:name)
        self.phoneNumber = phone
    }
    
    func report() {
        if let myBoss = boss {
            print("\(name) reported to \(myBoss.name)")
        } else {
            print("\(name) don't have boss")
        }
    }
    
    func callTaskToBoss() -> Task? {
        guard let myBoss = boss , callTo = myBoss.phoneNumber else {
            return nil
        }
        var callTask = Task(type:.Call(number: callTo), owner: self)
        //callTask.participant = myBoss
        return callTask
    }
}

let me = Employee(name: "Alex")
//me.name = "Alex"
me.phoneNumber = "010-1234-5678"
//let me:Employee = Employee(name: "Alex")

let toby = Employee(name: "Toby")
//toby.name = "Toby"
toby.phoneNumber = "010-8765-4321"

me.boss = toby

//var callTask = Task(title: "Call to Randy", time: 10*60)
//var callTask = Task(type: .Call, owner: me)
if let callTask = me.callTaskToBoss() {
    var todayTask:[Task] = []
    
    todayTask += [callTask]
    
    //callTask.title = "Call to Toby"
    
    
    //todayTask[0].title = "Call to Randy"
    todayTask[0].time = 15*60
    
    print("today task = \(todayTask) \r\n callTask = \(callTask)")
    print("\(todayTask[0].doBasicTask())")
}




//var reportTask = Task()
//reportTask.title = "Report to Boss"



