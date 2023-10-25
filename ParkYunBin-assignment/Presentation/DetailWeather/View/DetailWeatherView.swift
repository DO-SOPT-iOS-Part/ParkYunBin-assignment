//
//  DetailWeatherView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/19.
//

import UIKit

import SnapKit
import Then

final class DetailWeatherView: BaseView {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    private let backgroundImageView = UIImageView()
    private let detailTopView = DetailTopView(homeWeahter: HomeWeather.dummyWeather()[0])
    private let bottomLineView = UIView()
    private let cardView = DetailCardView(detailWeather: DetailWeather.totolData()[0])

    // MARK: - Override Functions

    override func configureUI() {
        self.addSubViews(backgroundImageView, detailTopView, cardView)
    }
    
    override func hieararchy() {
        backgroundImageView.do {
            $0.image = Image.detailBackground
        }
        
        bottomLineView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.5)
        }
    }
    
    override func setLayout() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailTopView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(34)
            $0.centerX.equalToSuperview()
        }
        
        cardView.snp.makeConstraints {
            $0.top.equalTo(detailTopView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

