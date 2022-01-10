//
//  Weather.swift
//  Baluchon
//
//  Created by Sylla on 29/12/2021.
//

import Foundation

// Struct to manage the data

struct WeatherInfo: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
}

struct Weather: Decodable {
    let main: String
}

struct Main: Decodable {
    let temp: Float
}

struct Wind: Decodable {
    let speed: Float
}

