//
//  WeatherBlockView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/18.
//

import UIKit

import SnapKit
import Then

class WeatherBlockView: UIView {
    
    // MARK: - Properties
    
    private let height: CGFloat = 117.0
    private let width: CGFloat = Size.width - 40
    private let position = String()
    private let weather = String()
    private let currentTemp = Int()
    private let highestTemp = Int()
    private let lowestTemp = Int()
    
    // MARK: - UI Components
    
    private var backgroundImage = UIImageView()
    private let positionTitleLabel = UILabel()
    private var myPositionLabel = UILabel()
    private var weatherStateLabel = UILabel()
    private var tempStateLabel = UILabel()
    private var highLowTempLabel = UILabel()
    private var positionStackView = UIStackView()
    
    // MARK: - init
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(homeWeahter: HomeWeather) {
        super.init(frame: CGRect())
        
        myPositionLabel.text = homeWeahter.position
        weatherStateLabel.text = homeWeahter.weather
        tempStateLabel.text = "\(homeWeahter.currentTemp)°"
        highLowTempLabel.text = "최고:\(homeWeahter.highestTemp)° 최저:\(homeWeahter.lowestTemp)°"
        
        configureUI()
        hieararchy()
        setLayout()
        
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        
        backgroundImage.do {
            $0.image = Image.weatherListBackground
        }
        
        positionTitleLabel.do {
            $0.text = "나의 위치"
            $0.font = .bold(size: 24)
            $0.textColor = .white
        }
        
        myPositionLabel.do {
            $0.font = .medium(size: 17)
            $0.textColor = .white
        }
        
        weatherStateLabel.do {
            $0.font = .medium(size: 16)
            $0.textColor = .white
        }
        
        tempStateLabel.do {
            $0.font = .light(size: 52)
            $0.textColor = .white
        }
        
        highLowTempLabel.do {
            $0.font = .medium(size: 15)
            $0.textColor = .white
        }
        
        positionStackView.do {
            $0.addArrangeSubViews(positionTitleLabel, myPositionLabel)
            $0.axis = .vertical
            $0.spacing = 2
            $0.alignment = .leading
        }
    }
    
    private func hieararchy() {
        self.addSubViews(backgroundImage,
                         positionStackView,
                         weatherStateLabel,
                         tempStateLabel,
                         highLowTempLabel)
    }
    
    private func setLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(height)
            $0.width.equalTo(width)
        }
        
        backgroundImage.snp.makeConstraints {
            $0.height.width.equalToSuperview()
        }
        
        positionStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        weatherStateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        tempStateLabel.snp.makeConstraints {
            $0.centerY.equalTo(positionStackView)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        highLowTempLabel.snp.makeConstraints {
            $0.centerY.equalTo(weatherStateLabel)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
