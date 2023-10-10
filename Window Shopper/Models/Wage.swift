//
//  Wage.swift
//  Window Shopper
//
//  Created by Jimmy Ghelani on 2023-10-10.
//

import Foundation

class Wage {
    static func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
