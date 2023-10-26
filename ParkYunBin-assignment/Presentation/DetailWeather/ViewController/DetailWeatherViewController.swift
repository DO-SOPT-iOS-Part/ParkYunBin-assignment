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
    private var id: Int = 0
    
    // MARK: - Override Functions
    
    override func hieararchy() {
        view.addSubview(detailWeatherView)
    }

    override func setLayout() {
        detailWeatherView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        detailWeatherView.drawerButton.addTarget(self, action: #selector(drawerButtonDidTapped), for: .touchUpInside)
    }
    
    // MARK: - Custom Functions
    
    func detailDataBind(homeWeather: HomeWeather, id: Int) {
        
        let dummyList = DetailWeather.totalDummy()
        
        guard let idMatchedData = dummyList.first(where: {$0.id == id}) else { return }
        
        detailWeatherView.cardView.dataBind(detailWeather: idMatchedData.timeLine)
        detailWeatherView.detailTopView.dataBind(homeWeather: homeWeather)
    }
    
    @objc
    private func drawerButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
}


