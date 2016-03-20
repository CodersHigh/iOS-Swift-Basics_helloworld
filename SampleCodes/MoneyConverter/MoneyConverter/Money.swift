//
//  Money.swift
//  MoneyConverter
//
//  Created by Lingostar on 2015. 12. 17..
//  Copyright © 2015년 CodersHigh. All rights reserved.
//

import Foundation
import MapKit
enum Currency:Int {
    case USD = 0, KRW, JPY, EUR
    
    var symbol:String {
        get {
            switch self {
            case .USD : return "$"
            case .KRW : return "₩"
            case .JPY : return "¥"
            case .EUR : return "€"
            }
        }
    }
    
    var ratio:Double {
        get {
            switch self {
            case .USD : return 1.0
            case .KRW : return 1178.5
            case .JPY : return 122.45
            case .EUR : return 0.92
            }
        }
    }
}

struct Money {
    
    //var location:CLLocationCoordinate2D
    
    var usdollar = 0.0
    
    init(_ _usdollar:Double){
        usdollar = _usdollar
    }
    
    init(_ amount:Double, currency:Currency){
        usdollar = amount / currency.ratio
    }

    func valueInCurrency(currency:Currency) -> String {
        return "\(currency.symbol) " + "\(usdollar*currency.ratio)"
    }
}


let money = Money(120.0)
let koreanIncome = Money(500_000 , currency:.KRW)


