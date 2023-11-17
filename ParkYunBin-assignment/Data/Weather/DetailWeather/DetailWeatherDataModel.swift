//
//  DetailWeatherDataModel.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/17.
//

import Foundation

// MARK: - DetailWeatherDataModel
struct DetailWeatherDataModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [WeatherSummary]
    let clouds: Clouds
    let wind: DetailWind
    let visibility: Int
    let pop: Double
    let sys: DetailSys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct DetailSys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct WeatherSummary: Codable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: String
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    case snow = "snow"
    case lightSnow = "light snow"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

// MARK: - DetailWind
struct DetailWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
