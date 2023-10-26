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
    
    private lazy var drawerButton = UIButton()
    private let weatherTitleLabel = UILabel()
    var searchBar = UISearchBar()
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    var listStackView = UIStackView()

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
            $0.searchTextField.textColor = .white
            $0.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
            $0.searchTextField.leftView?.tintColor = UIColor(white: 1, alpha: 0.5)
            $0.searchTextField.attributedPlaceholder = attributedString
        }
        
        listStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
            $0.alignment = .center
        }
    }
    
    override func hieararchy() {
        self.addSubViews(drawerButton,
                         weatherTitleLabel,
                         searchBar,
                         scrollView
        )
        
        scrollView.addSubview(contentView)
        contentView.addSubview(listStackView)
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
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.greaterThanOrEqualTo(listStackView.snp.height).priority(.low)
        }
        
        listStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentView)
            $0.top.bottom.equalTo(contentView)
            $0.centerX.equalTo(scrollView)
        }
        
        // 더미데이터에서 인덱스 및 데이터 가져와서, StackView에 넣어주기
        HomeWeather.dummyWeather().forEach {
            let list = WeatherBlockView(homeWeahter: $0)
            listStackView.addArrangedSubview(list)
        }
    }
}
