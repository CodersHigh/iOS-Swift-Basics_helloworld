//: Playground - noun: a place where people can play

import UIKit


var meetingRooms:Array<String> = ["Banksy", "Rivera", "Kahlo", "Picasso", "Cezanne", "Matisse"]
var groups:[Int] = [10, 8, 14, 9]

meetingRooms += ["Renoir"]


let maxSpeed:Int = 200

var currentSpeed:Int = 110
currentSpeed += 10

var speedHistory:[Int] = []
speedHistory += [currentSpeed]
let gpsSpeed0901 = 114.1
speedHistory.append(Int(gpsSpeed0901))

speedHistory.last

let historyBackup = speedHistory
speedHistory += [150]
historyBackup



var roomCapacity:[String:Int] = ["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]

//roomCapacity += ["Renoir":40]
roomCapacity["Renoir"] = 40
roomCapacity["Kahlo"]

//let roomNames = roomCapacity.keys
//let capacities = roomCapacity.values


let roomNames = [String](roomCapacity.keys)
let capacities = [Int](roomCapacity.values)

let total = capacities.reduce(0, combine: +)

let subway2 :Set = ["시청", "을지로입구", "을지로3가", "을지로4가","동대문역사문화공원", "신당", "상왕십리", "왕십리", "한양대", "뚝섬", "성수", "건대입구", "구의", "강변", "잠실나루", "잠실", "신천", "종합운동장", "삼성", "선릉", "역삼", "강남", "교대", "서초", "방배", "사당", "낙성대", "서울대입구", "봉천", "신림", "신대방", "구로디지털단지", "대림", "신도림", "문래", "영등포구청", "당산", "합정", "홍대입구", "신촌", "이대", "아현", "충정로"]

let subway3 :Set = ["지축", "구파발", "연신내", "불광", "녹번", "홍제", "무악재", "독립문", "경복궁", "안국", "종로3가", "을지로3가", "충무로", "동대입구", "약수", "금호", "옥수", "압구정", "신사", "잠원", "고속터미널", "교대", "남부터미널", "양재", "매봉", "도곡", "대치", "학여울", "대청", "일원", "수서", "가락시장", "경찰병원", "오금"]

let transfer = subway2.intersect(subway3)
let notTransfer = subway2.subtract(subway3)

let union = subway2.union(subway3)
let exOR = subway2.exclusiveOr(subway3)

if transfer.count > 0 {
    print("환승역은 \(transfer) 입니다.")
} else {
    print("환승역은 없습니다.")
}

for station in subway2 {
    print("이번 역은 \(station)입니다.")
}


for (roomName, capacity) in roomCapacity {
    let roomDescription:String
    switch capacity {
    case 4:
        roomDescription = "\(roomName)은 스터디 룸이며 정원은 \(capacity)명입니다."
    case 5...10:
        roomDescription = "\(roomName)은 팀 세미나 룸이며 정원은 \(capacity)명입니다."
    case 11...30:
        roomDescription = "\(roomName)은 그룹 세미나 룸이며 정원은 \(capacity)명입니다."
    case let caseCapacity where caseCapacity > 30:
        roomDescription = "\(roomName)의 정원은 \(capacity)명이며 별도의 사용신청이 필요합니다."
    default:
        roomDescription = "\(roomName)의 정보를 다시 확인해 주세요"
    }
    print("\(roomDescription)")
}



