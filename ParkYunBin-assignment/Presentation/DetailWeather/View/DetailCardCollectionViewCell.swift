//
//  DetailCardCollectionViewCell.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/09.
//

import UIKit

import SnapKit
import Then

final class DetailCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "DetailCardCollectionViewCell"
    
    // MARK: - UI Components
    
    private var timeLabel = UILabel()
    private var weatherImageView = UIImageView()
    private var tempLabel = UILabel()
    private var cellStackView = UIStackView()
    
    // MARK: - Override Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.configureUI()
        self.hieararchy()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
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
    
    private func hieararchy() {
        contentView.addSubview(cellStackView)
    }
    
    private func setLayout() {
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

