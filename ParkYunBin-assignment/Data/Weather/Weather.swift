//
//  Weather.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/19.
//

import Foundation

struct HomeWeather {
    let position: String
    let weather: String
    let currentTemp: Int
    let highestTemp: Int
    let lowestTemp: Int
}

extension HomeWeather {
    static func dummyWeather() -> [HomeWeather] {
        return [HomeWeather(position: "부천시",
                            weather: "맑음",
                            currentTemp: 26,
                            highestTemp: 32,
                            lowestTemp: 18),
                HomeWeather(position: "인천시",
                            weather: "흐림",
                            currentTemp: 23,
                            highestTemp: 32,
                            lowestTemp: 18),
                HomeWeather(position: "화성시",
                            weather: "맑음",
                            currentTemp: 22,
                            highestTemp: 32,
                            lowestTemp: 18),
                HomeWeather(position: "성남시",
                            weather: "흐림",
                            currentTemp: 28,
                            highestTemp: 32,
                            lowestTemp: 18),
                HomeWeather(position: "수원시",
                            weather: "맑음",
                            currentTemp: 29,
                            highestTemp: 32,
                            lowestTemp: 18),
                HomeWeather(position: "춘천시",
                            weather: "흐림",
                            currentTemp: 32,
                            highestTemp: 32,
                            lowestTemp: 18),
                HomeWeather(position: "남양주시",
                            weather: "맑음",
                            currentTemp: 23,
                            highestTemp: 32,
                            lowestTemp: 18),
                
        ]
    }
}
