//
//  WeatherViewController.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/15.
//

import UIKit

class WeatherViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private var weatherView = WeatherView()
    
    // MARK: - Override Functions
    
    override func hieararchy() {
        view.addSubview(weatherView)
    }

    override func setLayout() {
        weatherView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Custom Functions
}

