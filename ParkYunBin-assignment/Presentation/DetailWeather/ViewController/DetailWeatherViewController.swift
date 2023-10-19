//
//  DetailWeatherViewController.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/19.
//

import UIKit

class DetailWeatherViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private var detailWeatherView = DetailWeatherView()
    
    // MARK: - Override Functions
    
    override func hieararchy() {
        view.addSubview(detailWeatherView)
    }

    override func setLayout() {
        detailWeatherView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Custom Functions
}


