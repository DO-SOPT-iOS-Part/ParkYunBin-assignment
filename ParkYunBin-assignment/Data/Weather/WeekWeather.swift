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
    let highestTemp: Int
    let lowestTemp: Int
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
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
    
    static func secondWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
    
    static func thirdWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
    
    static func fourthWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
    
    static func fifthWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
    
    static func sixthWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
    
    static func seventhWeekDummy() -> [DailyWeather] {
        return [DailyWeather(day: "오늘", weather: .cloudyNight, highestTemp: 15, lowestTemp: 21),
                DailyWeather(day: "월", weather: .littleRain, highestTemp: 18, lowestTemp: 22),
                DailyWeather(day: "화", weather: .rain, highestTemp: 12, lowestTemp: 23),
                DailyWeather(day: "수", weather: .rainyAfternoon, highestTemp: 16, lowestTemp: 21),
                DailyWeather(day: "목", weather: .rain, highestTemp: 17, lowestTemp: 21),
                DailyWeather(day: "금", weather: .thunder, highestTemp: 11, lowestTemp: 21),
                DailyWeather(day: "토", weather: .rainyAfternoon, highestTemp: 13, lowestTemp: 25),
                DailyWeather(day: "일", weather: .rainyAfternoon, highestTemp: 14, lowestTemp: 21),
                DailyWeather(day: "월", weather: .cloudyNight, highestTemp: 17, lowestTemp: 28),
                DailyWeather(day: "화", weather: .thunder, highestTemp: 15, lowestTemp: 21)]
    }
}
