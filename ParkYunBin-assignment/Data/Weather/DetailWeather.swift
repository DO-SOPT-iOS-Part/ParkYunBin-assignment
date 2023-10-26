//
//  DetailWeather.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/25.
//

import UIKit

struct DetailWeather {
    let id: Int
    let timeLine: [WeatherTimeLine]
}

struct WeatherTimeLine {
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

extension DetailWeather {
    static func totalDummy() -> [DetailWeather] {
        return [DetailWeather(id: 0, timeLine: WeatherTimeLine.firstDummy()),
                DetailWeather(id: 1, timeLine: WeatherTimeLine.secondDummy()),
                DetailWeather(id: 2, timeLine: WeatherTimeLine.thirdDummy()),
                DetailWeather(id: 3, timeLine: WeatherTimeLine.fourthDummy()),
                DetailWeather(id: 4, timeLine: WeatherTimeLine.fifthDummy()),
                DetailWeather(id: 5, timeLine: WeatherTimeLine.sixthDummy()),
                DetailWeather(id: 6, timeLine: WeatherTimeLine.seventhDummy())]
    }
}

/// 더미데이터가 잘 들어갔는지 확인하기 위해
/// Now -> Weather 더미 Position 명으로 변경했습니다

extension WeatherTimeLine {
    static func firstDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "부천", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func secondDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "인천", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func thirdDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "화성", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func fourthDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "성남", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func fifthDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "수원", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func sixthDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "춘천", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
    
    static func seventhDummy() -> [WeatherTimeLine] {
        return [WeatherTimeLine(timeLine: "남양주", timeWeather: .cloudyNight, timeTemp: "21°"),
                WeatherTimeLine(timeLine: "10시", timeWeather: .cloudyNight, timeTemp: "22°"),
                WeatherTimeLine(timeLine: "11시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "12시", timeWeather: .cloudyNight, timeTemp: "19°"),
                WeatherTimeLine(timeLine: "1시", timeWeather: .cloudyNight, timeTemp: "23°"),
                WeatherTimeLine(timeLine: "2시", timeWeather: .cloudyNight, timeTemp: "27°"),
                WeatherTimeLine(timeLine: "3시", timeWeather: .cloudyNight, timeTemp: "30°"),
                WeatherTimeLine(timeLine: "4시", timeWeather: .cloudyNight, timeTemp: "12°")]
    }
}
