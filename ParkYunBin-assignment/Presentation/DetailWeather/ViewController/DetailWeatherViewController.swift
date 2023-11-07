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
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailWeatherView.dailyWeekWeatherTableView.reloadData()
    }
    
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
    
    func delegate() {
        detailWeatherView.dailyWeekWeatherTableView.delegate = self
        detailWeatherView.dailyWeekWeatherTableView.dataSource = self
        detailWeatherView.dailyWeekWeatherTableView.register(DetailWeekTableViewCell.self, forCellReuseIdentifier: DetailWeekTableViewCell.identifier)

    }
    
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


extension DetailWeatherViewController: UITableViewDelegate {}

extension DetailWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailWeekTableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailWeekTableViewCell.identifier) as? DetailWeekTableViewCell else {return UITableViewCell()}
        detailWeekTableViewCell.setCurrentTemp(totalHighestTemp: 11, totalLowestTemp: 30, lowestTemp: 15, highestTemp: 20)
        detailWeekTableViewCell.tempProgressView.setCurrentTemp(lowestTemp: 12, highestTemp: 19)
        return detailWeekTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
