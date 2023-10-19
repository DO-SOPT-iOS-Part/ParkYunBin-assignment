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
    
    private let myPositionLabel = UILabel()
    private let currentTemp = UILabel()
    private let currentWeather = UILabel()
    private let highLowTempLabel = UILabel()
    private let stackView = UIStackView()
    
    // MARK: - init
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(homeWeahter: HomeWeather) {
        super.init(frame: CGRect())
        
        myPositionLabel.text = homeWeahter.position
        currentWeather.text = homeWeahter.weather
        currentTemp.text = "\(homeWeahter.currentTemp)°"
        highLowTempLabel.text = "최고:\(homeWeahter.highestTemp)° 최저:\(homeWeahter.lowestTemp)°"
        
        configureUI()
        hieararchy()
        setLayout()
        
    }

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
}


