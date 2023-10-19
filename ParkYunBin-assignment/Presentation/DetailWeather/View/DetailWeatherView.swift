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
    private let cardView = UIView()
    private let weatherCommentLabel = UILabel()
    private let horizontalScrollView = UIScrollView()
    private let contentView = UIView()
    private let seperateLineView = LineView()
    private let bottomLineView = LineView()

    // MARK: - Override Functions

    override func configureUI() {
        self.addSubViews(backgroundImageView, detailTopView)
    }
    
    override func hieararchy() {
        backgroundImageView.do {
            $0.image = Image.detailBackground
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
    }
}

