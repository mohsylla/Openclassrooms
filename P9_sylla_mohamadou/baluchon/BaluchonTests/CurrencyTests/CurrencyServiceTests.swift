//
//  CurrencyServiceTests.swift
//  Baluchon_newTests
//
//  Created by Sylla on 27/12/2021.
//

import XCTest
@testable import Baluchon

class CurrencyServiceTests: XCTestCase {
    // Test if there is an error
    func testGetRateShouldPostFailedCallbackIfError() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getRate { result in
            // Then
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // Test if there is no data
    func testGetRateShouldPostFailedCallbackIfNoData() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFake(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getRate { result in
            // Then
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // Test if there an incorrect response
    func testGetRateShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseKO, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getRate { result in
            // Then
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // Test if there is incorrect data
    func testGetRateShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFake(data: FakeResponseData.IncorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getRate { result in
            // Then
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // Test if there is response and data correct and no error
    func testGetRateShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getRate { result in
            // Then
            guard case .success(let resultCurrency) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertEqual(resultCurrency.rates["USD"],1.092908)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
