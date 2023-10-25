//
//  DetailCardView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/26.
//

import UIKit

import SnapKit
import Then

final class DetailCardView: BaseView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let weatherCommentLabel = UILabel()
    private let horizontalScrollView = UIScrollView()
    private let contentView = UIView()
    private let seperateLineView = UIView()
    private let listStackView = UIStackView()
    
    // MARK: - init
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(detailWeather: [DetailWeather]) {
        super.init(frame: CGRect())
        
        detailWeather.forEach {
            let cell = DetailWeatherCell(detailWeather: $0)
            cell.snp.makeConstraints {
                $0.width.equalTo(44)
            }
            listStackView.addArrangedSubview(cell)
        }
        
        configureUI()
        hieararchy()
        setLayout()
        
    }

    // MARK: - Override Functions
    
    override func configureUI() {
        
        self.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.03)
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
            $0.layer.cornerRadius = 15
        }
    
        weatherCommentLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.numberOfLines = 2
            $0.font = .medium(size: 18)
            $0.textColor = .white
        }
        
        seperateLineView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.5)
        }
        
        horizontalScrollView.do {
            $0.showsHorizontalScrollIndicator = false

        }
        
        contentView.do {
            $0.backgroundColor = .darkGray

        }
        
        listStackView.do {
            $0.axis = .horizontal
            $0.spacing = 22
            $0.alignment = .center
        }
    }
    
    override func hieararchy() {
        self.addSubViews(weatherCommentLabel,
                         seperateLineView,
                         horizontalScrollView
        )
        
        horizontalScrollView.addSubview(contentView)
        contentView.addSubview(listStackView)
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(212)
        }
        
        weatherCommentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        seperateLineView.snp.makeConstraints {
            $0.height.equalTo(0.2)
            $0.top.equalTo(weatherCommentLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
        }
        
        horizontalScrollView.snp.makeConstraints {
            $0.top.equalTo(seperateLineView.snp.bottom).offset(14)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.leading.trailing.equalTo(horizontalScrollView.contentLayoutGuide).inset(15)
            $0.top.bottom.equalTo(horizontalScrollView.contentLayoutGuide)
        }
        
        listStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentView)
            $0.top.equalTo(contentView)
        }
    }
}


