//
//  WeatherIconEnum.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/08.
//

import UIKit

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
