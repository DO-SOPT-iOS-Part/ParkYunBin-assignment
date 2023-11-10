//
//  DetailCardHeaderView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/09.
//

import UIKit

import SnapKit
import Then

class DetailCardHeaderView: BaseView {
    
    // MARK: - Properties
    
    private var weatherCommentLabel = UILabel()
    var isScrolled: Bool = false {
        didSet {
            ifScrollStarted(isScrolled: self.isScrolled)
        }
    }

    // MARK: - UI Components

    override func configureUI() {
        weatherCommentLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.numberOfLines = 2
            $0.font = .medium(size: 18)
            $0.textColor = .white
        }
    }
    
    override func hieararchy() {
        addSubViews(weatherCommentLabel)
    }
    
    override func setLayout() {
        weatherCommentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    func ifScrollStarted(isScrolled: Bool) {
        if isScrolled {
            weatherCommentLabel.text = "⌚️ 시간별 일기예보"
            weatherCommentLabel.font = .medium(size: 15)
            weatherCommentLabel.textColor = .lightGray
        } else {
            weatherCommentLabel.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            weatherCommentLabel.numberOfLines = 2
            weatherCommentLabel.font = .medium(size: 18)
            weatherCommentLabel.textColor = .white
        }
    }
}

