//
//  CurrencyTests.swift
//  Baluchon_newTests
//
//  Created by Sylla on 27/12/2021.
//

import XCTest
@testable import Baluchon

class CurrencyTests: XCTestCase {
    
    let currency = Currency(rates: ["USD": 1.092908])
    
    // test if currency return a correct result
    func testCurrencyConvertShouldReturnCorrectResult() {
        let result = currency.convert(value: 1, from: "EUR", to: "USD")
        XCTAssertEqual(result, 1.092908)
    }
    
}
