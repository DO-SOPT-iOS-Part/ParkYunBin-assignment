//
//  DetailWeather.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/25.
//

import UIKit

struct DetailWeather {
    let timeLine: String
    let timeWeather: WeatherIcon
    let timeTemp: String
}

@frozen
enum WeatherIcon {
    case cloudyNight
    case littleRain
    case rain
    case rainyAfternoon
    case thunder
    
    var icon: UIImage {
        switch self {
        case .cloudyNight:
            return Image.cloudyNight
        case .littleRain:
            return Image.littleRain
        case .rain:
            return Image.rain
        case .rainyAfternoon:
            return Image.rainyAfternoon
        case .thunder:
            return Image.thunder
        }
    }
}

/// 더미데이터가 잘 들어갔는지 확인하기 위해
/// Now -> Weather 더미 Position 명으로 변경했습니다

extension DetailWeather {
    static func firstDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "부천", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func secondDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "인천", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func thirdDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "화성", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func fourthDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "성남", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func fifthDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "수원", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func sixthDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "춘천", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func seventhDummy() -> [DetailWeather] {
        return [DetailWeather(timeLine: "남양주", timeWeather: .cloudyNight, timeTemp: "21°"),
                DetailWeather(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                DetailWeather(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                DetailWeather(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                DetailWeather(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                DetailWeather(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                DetailWeather(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func totolData() -> [[DetailWeather]] {
        return [firstDummy(), secondDummy(), thirdDummy(), fourthDummy(), fifthDummy(), sixthDummy(), seventhDummy()]
    }
}
