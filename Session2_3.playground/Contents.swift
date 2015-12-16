//: Playground - noun: a place where people can play

import UIKit

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
    
    func doBasicTask() ->String {
        let taskDescription:String
        switch type {
        case .Call(let number) :
            taskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time) :
            taskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Meet(let participant, let location) :
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
    var name:String?
    var phoneNumber:String?
    var boss:Employee?
    
    init (name:String){
        self.name = name
    }
    
    convenience init (name:String, phone:String) {
        self.init(name:name)
        self.phoneNumber = phone
    }
    
    func report() {
        if let myBoss = boss {
            print("\(self.name) reported to \(myBoss.name)")
        } else {
            print("\(name) don't have boss")
        }
    }
    
    func callTaskToBoss() -> Task? {
        if let myBoss = boss, callTo = myBoss.phoneNumber {
            var callTask = Task(type: .Call(number:callTo), owner: self)
            return callTask
        }
        return nil
    }
}
var todayTask:[Task] = []

let me:Employee = Employee(name: "Alex", phone: "010-1234-5678")

let toby = Employee(name: "Toby")
toby.phoneNumber = "011-5678-1234"

me.boss = toby
me.report()


var reportTask = Task (type: .Report(to:toby, when:"Afternoon"), owner: me)
todayTask += [reportTask]
if let callTask = me.callTaskToBoss() {
    todayTask += [callTask]
    callTask.doBasicTask()
}

reportTask.doBasicTask()





