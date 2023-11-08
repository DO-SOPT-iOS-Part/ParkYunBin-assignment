//
//  DetailTempBarView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/08.
//

import UIKit

import SnapKit
import Then

class DetailTempBarView: BaseView {
    private var totalHighestTemp: Int = Int()
    private var totalLowestTemp: Int = Int()
    
    
    private var lowestTemp: Int = Int()
    {
        didSet {
            progressInnerView.snp.updateConstraints{
                $0.leading.equalTo(self).inset(width * Double((lowestTemp - totalLowestTemp)))
            }
        }
    }
    
    private var highestTemp: Int = Int()
    {
        didSet {
            progressInnerView.snp.updateConstraints {
                $0.trailing.equalToSuperview().inset(width * Double((totalHighestTemp - highestTemp)))
            }
        }
    }
    
    private var width: Double = Double()
    
    // MARK: - UI Components
    
    private var progressInnerView = UIView()
    
    
    init(totalHighestTemp: Int, totalLowestTemp: Int) {
        super.init(frame: CGRect())
        
        self.totalHighestTemp = totalHighestTemp
        self.totalLowestTemp = totalLowestTemp
        self.width = 100.0 / (Double(totalHighestTemp - totalLowestTemp) + 1.0)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        self.do {
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .blue
        }
        
        progressInnerView.do {
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .orange
        }
    }
    
    override func hieararchy() {
        self.addSubview(progressInnerView)
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(4)
        }
        
        progressInnerView.snp.makeConstraints {
            $0.height.trailing.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    func setCurrentTemp(lowestTemp: Int, highestTemp: Int) {
        self.lowestTemp = lowestTemp
        self.highestTemp = highestTemp
        self.width = Double(bounds.width) / (Double(totalHighestTemp - totalLowestTemp) + 1.0)
    }
}
