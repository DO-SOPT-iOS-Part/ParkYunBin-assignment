//
//  DetailWeatherCell.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/26.
//

import UIKit

import SnapKit
import Then

final class DetailWeatherCell: BaseView {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    private var timeLabel = UILabel()
    private var weatherImageView = UIImageView()
    private var tempLabel = UILabel()
    private var cellStackView = UIStackView()

    // MARK: - Override Functions

    override func configureUI() {
        
        timeLabel.do {
            $0.font = .medium(size: 17)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.font = .bold(size: 22)
            $0.textColor = .white
        }
        
        cellStackView.do {
            $0.addArrangeSubViews(timeLabel, weatherImageView, tempLabel)
            $0.axis = .vertical
            $0.spacing = 14
            $0.alignment = .center
        }
    }
    
    override func hieararchy() {
            addSubview(cellStackView)
        }
    
    override func setLayout() {
        cellStackView.snp.makeConstraints {
            $0.width.equalTo(44)
        }
    }
    
    func cellDataBind(timeLine: WeatherTimeLine) {
        timeLabel.text = timeLine.timeLine
        weatherImageView.image = timeLine.timeWeather.icon
        tempLabel.text = timeLine.timeTemp
    }
}

