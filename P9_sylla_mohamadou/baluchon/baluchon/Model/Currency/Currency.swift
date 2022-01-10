//
//  Currency.swift
//  Baluchon
//
//  Created by Sylla on 22/12/2021.
//

import Foundation

// structure to manage data and to convert

struct Currency: Decodable {
    
    var rates: [String: Double]
    
    private func convertFromEuro(value: Double, rate: Double) -> Double {
        return value * rate
    }
    
    func convert(value: Double, from: String, to: String) -> Double {
        guard let rate = rates[to] else { return 0.00 }
        let convertValue = convertFromEuro(value: value, rate: rate)
        return convertValue
    }
}
