//
//  WeatherView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/16.
//

import UIKit

import SnapKit
import Then

final class WeatherView: BaseView {

    // MARK: - UI Components
    
    private var drawerButton = UIButton()
    private let weatherTitleLabel = UILabel()
    private var searchBar = UISearchBar()
    private var weatherListView = WeatherBlockView()
    private var scrollView = UIScrollView()
    private var contentView = UIView()

    // MARK: - Override Functions

    override func configureUI() {
        weatherListView.do {
            $0.setListInfo(position: "의정부시",
                           weather: "흐림",
                           currentTemp: 21,
                           highestTemp: 27,
                           lowestTemp: 12)
        }
    }
    
    override func hieararchy() {
        self.addSubViews(weatherListView)
    }
    
    override func setLayout() {
        weatherListView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
