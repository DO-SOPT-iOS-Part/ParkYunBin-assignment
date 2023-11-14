//
//  DetailCardCollectionView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/09.
//

import UIKit

import SnapKit
import Then

final class DetailCardTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "DetailCardTableViewCell"
    private var weatherTimeLineList = WeatherTimeLine.firstDummy()
    
    // MARK: - UI Components
    
    private let seperateBar = UIView()
    private lazy var cardCollectionView = UICollectionView(frame: CGRect.zero,
                                                           collectionViewLayout: self.saleFlowLayout)
    
    let saleFlowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
    
    // MARK: - init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
        self.hieararchy()
        self.setLayout()
        self.setCollectionView()
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        
        self.do {
            $0.backgroundColor = .clear
            $0.selectionStyle = .none
        }
        
        cardCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
        
        seperateBar.do {
            $0.backgroundColor = .darkGray
        }
    }
    
    private func hieararchy() {
        contentView.addSubViews(
            seperateBar,
            cardCollectionView
        )
    }
    
    private func setLayout() {
        
        seperateBar.snp.makeConstraints {
            $0.height.equalTo(0.2)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        cardCollectionView.snp.makeConstraints {
            $0.top.equalTo(seperateBar.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.register(DetailCardCollectionViewCell.self, forCellWithReuseIdentifier: DetailCardCollectionViewCell.identifier)
    }
    
    func dataBind(data: [WeatherTimeLine]) {
        self.weatherTimeLineList = data
    }
}

extension DetailCardTableViewCell: UICollectionViewDelegate {}

extension DetailCardTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCardCollectionViewCell.identifier,
                                                            for: indexPath) as? DetailCardCollectionViewCell else { return UICollectionViewCell() }
        
        cell.cellDataBind(timeLine: weatherTimeLineList[indexPath.row])
        return cell
    }
}

extension DetailCardTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 146)
    }
}
