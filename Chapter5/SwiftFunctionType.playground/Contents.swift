//: Playground - noun: a place where people can play

import UIKit

//: Session 5-1 Function Types

func addVAT(source:Double) -> Double {
    return source * 1.1
}

func couponDiscount(source:Double) -> Double {
    return source * 0.9
}


var additional:(Double) -> Double

let transcation3219 = 120.7
additional = addVAT

let price3219 = additional(transcation3219)

func finalPrice(source:Double, additional:(Double) -> Double) -> Double {
    
    let price = additional(source)
    
    return price
}

let price3220 = finalPrice(source: 350.0, additional: couponDiscount)


//: Session 5-2 Closure

let addVATClosure = { (source:Double) -> Double in
    return source * 1.1
}
let addVATClosure2 = { source in
    return source * 1.1
}
let addVATClosure3 = { source in
    source * 1.1
}
let addVATClosure4 = { $0 * 1.1 }

let couponDiscountClosure = { (source:Double) -> Double in
    return source * 0.9
}
let couponDiscountClosure2 = { source in
    return source * 0.9
}
let couponDiscountClosure3 = { source in
    source * 0.9
}
let couponDiscountClosure4 = { $0 * 0.9 }

let price3221 = addVATClosure4(157.6)


/*func makeAdder (x:Int) -> (Int) -> Int {
    func adder(a:Int) -> Int {
        return x+a
    }
    return adder
}*/

/*func makeAdder(x:Int) -> (Int) -> Int {
    let adder:(Int) -> Int = {
        return $0 + x
    }
    return adder
}*/

func makeAdder(x:Int) -> (Int) ->Int {
    return {
        return $0 + x;
    }
}

let add5 = makeAdder(x: 5)
let add10 = makeAdder(x: 10)

print(add5(2))
print(add10(2))

print(makeAdder(x: 5)(2))


//: Session 5-6 map
let transactions = [560.0, 321.5, 190.0, 672.8, 1190.0, 450.0]

/*func addVAT(source:Double) -> Double {
    return source * 1.1
}*/

var vatPrices:[Double] = []
for transaction in transactions {
    vatPrices += [addVAT(source: transaction)]
}

let vatMapPrices = transactions.map({ transaction -> Double in
    return transaction * 1.1
})

let vatMapPrices2 = transactions.map({ $0 * 1.1 })


//: Session 5-7 filter
var bigTransactions:[Double] = []
for price in vatPrices {
    if price >= 500 {
        bigTransactions += [price]
    }
}

let bigFilterTransactions = vatPrices.filter{ $0 >= 500 }

var meetingRooms:[String:Int] = ["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]

let members = 9
let available = meetingRooms.filter{ $0.1 > members}
print(available)


//: Session 5-8 sort

func ascendantSort (sort1:Double, sort2:Double) -> Bool {
    return sort1 > sort2
}

let sortedPrices = vatPrices.sorted(by: ascendantSort)
let sortedPrices2 = vatPrices.sorted(by: { sort1, sort2 in
    return sort1 > sort2
})
let sortedPrices3 = vatPrices.sorted(by: { $0 > $1 })
let sortedPrices4 = vatPrices.sorted( by: > )

let sortedMeetingRooms = meetingRooms.sorted(by: {$0.1 > $1.1})
print("\(sortedMeetingRooms)")

//: Session 5-9 reduce



func priceSum (base:Double, adder:Double) -> Double {
    return base + adder
}

var sum:Double = 0.0

for price in vatPrices {
    sum = priceSum(base: sum, adder: price)
}

print("\(sum)")
var sum2:Double = 0.0
let sumReduce = vatPrices.reduce(sum2, priceSum)
let sumReduce2 = vatPrices.reduce(0.0, { base, adder in
    base + adder
})
let sumReduce3 = vatPrices.reduce(0, +)


let pricesInString = vatPrices.reduce("", {$0 + "\($1)\n"})

print(pricesInString)


let descriptionString = meetingRooms.reduce("We have meeting rooms : \n", { $0 + "\($1.0) for \($1.1) person \n"

})

print(descriptionString)

//: Session 5-10 MeetingRooms 정렬










let x = [10, 3, 20, 15, 4].sorted {$0 < $1}
let x1 = x.filter { $0 > 5 }.map { $0 * 100 }
let x2 = [10, 3, 20, 15, 4].sorted {$0 < $1}
x2


