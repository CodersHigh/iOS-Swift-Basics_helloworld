//: Playground - noun: a place where people can play

import UIKit

var title : String = "Storyboard Prototyping"
var ratings : [Double]? = nil
var supportURL : String! = nil

supportURL = "www.codershigh.com"
ratings = [4.5, 3.0, 5.0, 2.5]



func ratingRecord (history:[Double]) -> (average:Double, min:Double, max:Double) {
    
    var sum = 0.0, min = history[0], max = history[0]
    
    for value in history {
        if min > value { min = value }
        if max < value { max = value }
        sum += value
    }
    
    let average = sum / Double(history.count)
    return (average, min, max)
}





var bookDescription:String = "\(title)"
if let theRatings = ratings {
    let record = ratingRecord(theRatings)
    bookDescription += "has \(theRatings.count) ratings, \r\n average is \(record.average), from \(record.min) to \(record.max)"
}
//if let theURL = supportURL {
//    bookDescription += "\r\nsupport web page : \(theURL)"
//}
bookDescription += "\r\nsupport web page : \(supportURL)"

print("\(bookDescription)")

//print ("\(title) has \(ratings!.count) ratings. \r\nsupport web page : \(supportURL)")

func myFunction () {
    
}


myFunction()









