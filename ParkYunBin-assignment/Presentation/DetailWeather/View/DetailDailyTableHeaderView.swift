//
//  DetailDailyTableHeaderView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/08.
//

import UIKit

import SnapKit
import Then

class DetailDailyTableHeaderView: BaseView {

    private let calenderImageView = UIImageView(image: UIImage(systemName: "calendar"))
    private let topLabel = UILabel()
    
    // MARK: - UI Components

    override func configureUI() {
        calenderImageView.do {
            $0.tintColor = .lightGray
        }
        
        topLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = .medium(size: 15)
            $0.textColor = .lightGray
        }
    }
    
    override func hieararchy() {
        addSubViews(calenderImageView, topLabel)
    }
    
    override func setLayout() {
        calenderImageView.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(19)
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        topLabel.snp.makeConstraints {
            $0.leading.equalTo(calenderImageView.snp.trailing).offset(5)
            $0.centerY.equalTo(calenderImageView)
        }
    }

}
