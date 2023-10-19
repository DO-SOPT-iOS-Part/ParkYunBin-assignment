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
    
    // MARK: - Properties
    
    let placeholder: String = "도시 또는 공항 검색"
    private lazy var attributedString = NSMutableAttributedString(string: placeholder,
                                                                  attributes: [NSAttributedString.Key.font: UIFont.regular(size: 19) ,
                                                                               NSAttributedString.Key.foregroundColor: UIColor(white: 1,
                                                                                                                               alpha: 0.5)])

    // MARK: - UI Components
    
    private var drawerButton = UIButton()
    private let weatherTitleLabel = UILabel()
    private var searchBar = UISearchBar()
    private var weatherListView = WeatherBlockView(position: "의정부시", weather: "흐림", currentTemp: 21, highestTemp: 27, lowestTemp: 12)
    private var scrollView = UIScrollView()
    private var contentView = UIView()

    // MARK: - Override Functions

    override func configureUI() {
        drawerButton.do {
            $0.setImage(Image.options, for: .normal)
        }
        
        weatherTitleLabel.do {
            $0.text = "날씨"
            $0.font = .bold(size: 36)
            $0.textColor = .white
        }
        
        searchBar.do {
            $0.showsCancelButton = false
            $0.backgroundImage = UIImage()
            $0.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
            $0.searchTextField.leftView?.tintColor = UIColor(white: 1, alpha: 0.5)
            $0.searchTextField.attributedPlaceholder = attributedString
        }
        
//        weatherListView.do {
//            $0.setListInfo(position: "의정부시",
//                           weather: "흐림",
//                           currentTemp: 21,
//                           highestTemp: 27,
//                           lowestTemp: 12)
//        }
    }
    
    override func hieararchy() {
        self.addSubViews(drawerButton,
                         weatherTitleLabel,
                         searchBar,
                         weatherListView)
    }
    
    override func setLayout() {
        
        drawerButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(8)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(44)
        }
        
        weatherTitleLabel.snp.makeConstraints {
            $0.top.equalTo(drawerButton.snp.bottom).offset(1)
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(weatherTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        weatherListView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.height.equalTo(117)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
