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
    var drawerButton = UIButton()
    var dailyWeekWeatherTableView = UITableView(frame: .zero, style: .plain)
    private var totalScrollView = UIScrollView()
    private var contentView = UIView()
    private var id: Int = Int()
    private let backgroundImageView = UIImageView()
    private let detailBottomview = DetailBottomView()
    
    // MARK: - Override Functions

    override func configureUI() {
        backgroundImageView.do {
            $0.image = Image.detailBackground
        }
        
        dailyWeekWeatherTableView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.03)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
            $0.sectionHeaderTopPadding = 0
        }
        
        totalScrollView.do {
            $0.alwaysBounceVertical = true
        }
    }
    
    override func hieararchy() {
        self.addSubViews(backgroundImageView,
                         totalScrollView,
                         detailBottomview
        )
        
        totalScrollView.addSubViews(contentView)
        contentView.addSubViews(detailTopView,
                                dailyWeekWeatherTableView)
        
    }
    
    override func setLayout() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        totalScrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(detailBottomview.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(Size.width)
        }
        
        detailTopView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.centerX.equalToSuperview()
        }
        
        dailyWeekWeatherTableView.snp.makeConstraints {
            $0.top.equalTo(detailTopView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(500)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        detailBottomview.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
        
        dailyWeekWeatherTableView.tableHeaderView?.frame = .init(origin: .zero,
                                                                 size: .init(width: UIScreen.main.bounds.width,
                                                                             height: 38))
    }
}

