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
    
    var detailTopView = DetailTopView()
    var cardView = DetailCardView()
    var drawerButton = UIButton()
    private var id: Int = Int()
    private let backgroundImageView = UIImageView()
    private let bottomLineView = UIView()
    private var mapButton = UIButton()
    private var locationIcon = UIImageView()
    private var dotIcon = UIImageView()
    private var pageStackView = UIStackView()
    
    // MARK: - Override Functions

    override func configureUI() {
        backgroundImageView.do {
            $0.image = Image.detailBackground
        }
        
        bottomLineView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.5)
        }
        
        mapButton.do {
            $0.setImage(Image.map, for: .normal)
        }
        
        drawerButton.do {
            $0.setImage(Image.list, for: .normal)
        }
        
        locationIcon.do {
            $0.image = Image.location
        }
        
        dotIcon.do {
            $0.image = Image.ellipse
        }
        
        pageStackView.do {
            $0.addArrangeSubViews(locationIcon, dotIcon)
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
    }
    
    override func hieararchy() {
        self.addSubViews(backgroundImageView,
                         detailTopView,
                         cardView,
                         bottomLineView,
                         mapButton,
                         drawerButton,
                         pageStackView
        )
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
        
        bottomLineView.snp.makeConstraints {
            $0.height.equalTo(0.2)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(62)
        }
        
        mapButton.snp.makeConstraints {
            $0.height.width.equalTo(44)
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(bottomLineView.snp.bottom).offset(4)
        }
        
        drawerButton.snp.makeConstraints {
            $0.height.width.equalTo(44)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(bottomLineView.snp.bottom).offset(4)
        }
        
        pageStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bottomLineView.snp.bottom).offset(14)
        }
        
        locationIcon.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
        
        dotIcon.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
    }
}

