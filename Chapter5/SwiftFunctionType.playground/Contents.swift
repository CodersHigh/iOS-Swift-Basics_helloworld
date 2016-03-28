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

let price3220 = finalPrice(350.0, additional: couponDiscount)


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

func makeAdder(x:Int) -> Int -> Int {
    return {
        return $0 + x;
    }
}

let add5 = makeAdder(5)
let add10 = makeAdder(10)

print(add5(2))
print(add10(2))

print(makeAdder(5)(2))






