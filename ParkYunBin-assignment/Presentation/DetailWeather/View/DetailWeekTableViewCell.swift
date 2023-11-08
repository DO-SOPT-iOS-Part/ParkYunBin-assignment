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
    var totalHighestTemp: Int = Int()
    var totalLowestTemp: Int = Int()
    var lowestTemp: Int = Int()
    var highestTemp: Int = Int()
    private var tempProgressViewAdded = false

    // MARK: - UI Components
    
    private let seperateBar = UIView()
    private let dailyLabel = UILabel()
    private let weatherIcon = UIImageView()
    private let highestTempLabel = UILabel()
    private let lowestTempLabel = UILabel()
    lazy var tempProgressView: DetailTempBarView? = nil
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
            $0.backgroundColor = .darkGray
        }
        
        dailyLabel.do {
            $0.text = "월"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        weatherIcon.do {
            $0.image = WeatherIcon.cloudyNight.icon
        }
        
        lowestTempLabel.do {
            $0.text = "15°"
            $0.font = .medium(size: 22)
            $0.textColor = .systemGray
        }
            
        highestTempLabel.do {
            $0.text = "21°"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        tempStackView.do {
            $0.spacing = 13
            $0.axis = .horizontal
            $0.alignment = .center
        }
    }
    
    private func hierarchy() {
        contentView.addSubViews(seperateBar, dailyLabel, weatherIcon, tempStackView)
        tempStackView.addArrangeSubViews(lowestTempLabel, highestTempLabel)
    }
    
    private func setLayout() {
        seperateBar.snp.makeConstraints {
            $0.height.equalTo(0.2)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
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
        lowestTempLabel.text = "\(lowestTemp)°"
        highestTempLabel.text = "\(highestTemp)°"
        tempProgressView = DetailTempBarView(totalHighestTemp: totalHighestTemp,
                                             totalLowestTemp: totalLowestTemp)
        
        /// 최저온도 최저온도를 VC로부터 받고 난 이후, 인스턴스를 생성하고 StackView에 삽입합니다.
        if !tempProgressViewAdded {
            tempProgressView = DetailTempBarView(totalHighestTemp: totalHighestTemp, totalLowestTemp: totalLowestTemp)
            tempProgressView?.setCurrentTemp(lowestTemp: lowestTemp, highestTemp: highestTemp)
            if let tempProgressView = tempProgressView {
                tempStackView.insertArrangedSubview(tempProgressView, at: 1)
                tempProgressViewAdded = true
            }
            
            tempProgressView?.snp.makeConstraints {
                $0.width.equalTo(100)
                $0.height.equalTo(4)
            }
        }
    }
    
    func cellDataBind(daily: String, weather: UIImage) {
        dailyLabel.text = daily
        weatherIcon.image = weather
    }
}
