//
//  DetailWeekTableViewCell.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/08.
//

import UIKit

import SnapKit
import Then

class DetailWeekTableViewCell: UITableViewCell {
    
    // MARK: - Properties
        
    static let identifier = "DetailWeekTableViewCell"
    var totalHighestTemp: Int = 30
    var totalLowestTemp: Int = 11
    var lowestTemp: Int = 15
    var highestTemp: Int = 24

    // MARK: - UI Components
    
    private let seperateBar = UIView()
    private let dailyLabel = UILabel()
    private let weatherIcon = UIImageView()
    private let higestTempLabel = UILabel()
    private let lowestTempLabel = UILabel()
    lazy var tempProgressView = DetailTempBarView(totalHighestTemp: self.totalHighestTemp,
                                                  totalLowestTemp: self.totalLowestTemp,
                                                  lowestTemp: self.lowestTemp,
                                                  highestTemp: self.highestTemp)
    private let tempStackView = UIStackView()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        configureUI()
        hierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        seperateBar.do {
            $0.backgroundColor = .white
        }
        
        dailyLabel.do {
            $0.text = "월"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        weatherIcon.do {
            $0.image = WeatherIcon.cloudyNight.icon
        }
        
        higestTempLabel.do {
            $0.text = "15°"
            $0.font = .medium(size: 22)
            $0.textColor = .systemGray
        }
            
        lowestTempLabel.do {
            $0.text = "21°"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        tempStackView.do {
            $0.spacing = 10
            $0.axis = .horizontal
            $0.alignment = .center
        }
    }
    
    private func hierarchy() {
        contentView.addSubViews(seperateBar, dailyLabel, weatherIcon, tempStackView)
        tempStackView.addArrangeSubViews(higestTempLabel, tempProgressView, lowestTempLabel)
    }
    
    private func setLayout() {
        seperateBar.snp.makeConstraints {
            $0.height.equalTo(0.2)
            $0.top.equalToSuperview()
        }
        
        dailyLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        tempStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17)
            $0.centerY.equalToSuperview()
        }
        
        weatherIcon.snp.makeConstraints {
            $0.trailing.equalTo(tempStackView.snp.leading).offset(-15)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setCurrentTemp(totalHighestTemp: Int, totalLowestTemp: Int, lowestTemp: Int, highestTemp: Int) {
        self.totalLowestTemp = totalLowestTemp
        self.totalHighestTemp = totalHighestTemp
        self.lowestTemp = lowestTemp
        self.highestTemp = highestTemp
    }
    
}
