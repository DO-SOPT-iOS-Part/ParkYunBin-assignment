//
//  DetailTopView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/19.
//

import UIKit

import SnapKit
import Then

final class DetailTopView: BaseView {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    var myPositionLabel = UILabel()
    var currentTemp = UILabel()
    var currentWeather = UILabel()
    var highLowTempLabel = UILabel()
    var stackView = UIStackView()
    
    // MARK: - Override Functions
    
    override func configureUI() {
        
        myPositionLabel.do {
            $0.font = .regular(size: 36)
            $0.textColor = .white
        }
        
        currentTemp.do {
            $0.font = .thin(size: 102)
            $0.textColor = .white
        }
        
        currentWeather.do {
            $0.font = .regular(size: 24)
            $0.textColor = .white
        }
        
        highLowTempLabel.do {
            $0.font = .medium(size: 20)
            $0.textColor = .white
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .center
        }
    
    }
    
    override func hieararchy() {
        addSubview(stackView)
        stackView.addArrangeSubViews(myPositionLabel, currentTemp, currentWeather, highLowTempLabel)

    }
    
    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(homeWeather: HomeWeather) {
        myPositionLabel.text = homeWeather.position
        currentWeather.text = homeWeather.weather
        currentTemp.text = "\(homeWeather.currentTemp)°"
        highLowTempLabel.text = "최고:\(homeWeather.highestTemp)° 최저:\(homeWeather.lowestTemp)°"
    }
}


