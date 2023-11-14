//
//  WeekWeather.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/08.
//

import UIKit

struct WeekWeather {
    let id: Int
    let dailyWeathers: [DailyWeather]
}

struct DailyWeather {
    let day: String
    let weather: WeatherIcon
    let lowestTemp: Int
    let highestTemp: Int
}

extension WeekWeather {
    static func totalWeekDummy() -> [WeekWeather] {
        return [WeekWeather(id: 1, dailyWeathers: DailyWeather.firstWeekDummy()),
                WeekWeather(id: 2, dailyWeathers: DailyWeather.secondWeekDummy()),
                WeekWeather(id: 3, dailyWeathers: DailyWeather.thirdWeekDummy()),
                WeekWeather(id: 4, dailyWeathers: DailyWeather.fourthWeekDummy()),
                WeekWeather(id: 5, dailyWeathers: DailyWeather.fifthWeekDummy()),
                WeekWeather(id: 6, dailyWeathers: DailyWeather.sixthWeekDummy()),
                WeekWeather(id: 7, dailyWeathers: DailyWeather.seventhWeekDummy())]
    }
}

extension DailyWeather {
    static func firstWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, lowestTemp: 15, highestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, lowestTemp: 16, highestTemp: 21),
                DailyWeather(day: "목", weather: .rain, lowestTemp: 17, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 11, highestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, lowestTemp: 13, highestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, lowestTemp: 14, highestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 15, highestTemp: 21)]
    }
    
    static func secondWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .rain, lowestTemp: 10, highestTemp: 21),
                DailyWeather(day: "월", weather: .thunder, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, lowestTemp: 18, highestTemp: 21),
                DailyWeather(day: "목", weather: .cloudyNight, lowestTemp: 17, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 11, highestTemp: 26),
                DailyWeather(day: "토", weather: .littleRain, lowestTemp: 13, highestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, lowestTemp: 14, highestTemp: 29),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 13, highestTemp: 21)]
    }
    
    static func thirdWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .littleRain, lowestTemp: 15, highestTemp: 26),
                DailyWeather(day: "월", weather: .rainyAfternoon, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, lowestTemp: 16, highestTemp: 21),
                DailyWeather(day: "목", weather: .rain, lowestTemp: 17, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 11, highestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, lowestTemp: 9, highestTemp: 25),
                DailyWeather(day: "일", weather: .littleRain, lowestTemp: 14, highestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 15, highestTemp: 21)]
    }
    
    static func fourthWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .rainyAfternoon, lowestTemp: 15, highestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .thunder, lowestTemp: 16, highestTemp: 21),
                DailyWeather(day: "목", weather: .rain, lowestTemp: 18, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 16, highestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, lowestTemp: 13, highestTemp: 25),
                DailyWeather(day: "일", weather: .rain, lowestTemp: 14, highestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 15, highestTemp: 21)]
    }
    
    static func fifthWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .rainyAfternoon, lowestTemp: 15, highestTemp: 21),
                DailyWeather(day: "월", weather: .rainyAfternoon, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, lowestTemp: 16, highestTemp: 21),
                DailyWeather(day: "목", weather: .rain, lowestTemp: 17, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 11, highestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, lowestTemp: 13, highestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, lowestTemp: 14, highestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 15, highestTemp: 21)]
    }
    
    static func sixthWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, lowestTemp: 15, highestTemp: 21),
                DailyWeather(day: "월", weather: .thunder, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .littleRain, lowestTemp: 16, highestTemp: 21),
                DailyWeather(day: "목", weather: .rain, lowestTemp: 17, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 11, highestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, lowestTemp: 13, highestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, lowestTemp: 14, highestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 15, highestTemp: 21)]
    }
    
    static func seventhWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, lowestTemp: 15, highestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, lowestTemp: 18, highestTemp: 22),
                DailyWeather(day: "화", weather: .rain, lowestTemp: 12, highestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, lowestTemp: 16, highestTemp: 30),
                DailyWeather(day: "목", weather: .rain, lowestTemp: 17, highestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, lowestTemp: 15, highestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, lowestTemp: 13, highestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, lowestTemp: 14, highestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, lowestTemp: 17, highestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, lowestTemp: 10, highestTemp: 21)]
    }
}
