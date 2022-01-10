//
//  CurrencyService.swift
//  Baluchon
//
//  Created by Sylla on 22/12/2021.
//

import Foundation

final class CurrencyService {
    
    // MARK: - Properties
    
    // URLSessionsDataTask
    private var task: URLSessionDataTask?
    // URLSession
    private var currencySession: URLSession
    // initialiaze URLSession
    init(currencySession: URLSession = URLSession(configuration: .default)) {
        self.currencySession = currencySession
    }
    
    // MARK: - Method
    
    /// send a request to Fixer API and return response
    func getRate(callback: @escaping (Result<Currency, ErrorCases>) -> Void) {
        // compose url
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=c1cf97f664f2925e21dbb79b3524ce4a") else { return }
        task?.cancel()
        task = currencySession.dataTask(with: url) { (data, response, error) in
            // check error
            guard let data = data, error == nil else {
                callback(.failure(.errorNetwork))
                return
            }
            // check status response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.invalidRequest))
                return
            }
            // check response JSON
            guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
                callback(.failure(.errorDecode))
                return
            }
            callback(.success(responseJSON))
        }
        task?.resume()
    }
}
