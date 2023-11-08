//
//  DetailWeatherViewController.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/19.
//

import UIKit

class DetailWeatherViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var dummyData = WeekWeather.totalWeekDummy()
    var id: Int = 0
    
    // MARK: - UI Components
    
    private var detailWeatherView = DetailWeatherView()
    
    // MARK: - Life Cycles
    
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
        detailWeatherView.dailyWeekWeatherTableView.register(DetailWeekTableViewCell.self,
                                                             forCellReuseIdentifier: DetailWeekTableViewCell.identifier)

    }
    
    func detailDataBind(homeWeather: HomeWeather, id: Int) {
        
        self.id = id
        let dummyList = DetailWeather.totalDummy()
        guard let idMatchedData = dummyList.first(where: {$0.id == id}) else { return }
        detailWeatherView.cardView.dataBind(detailWeather: idMatchedData.timeLine)
        detailWeatherView.detailTopView.dataBind(homeWeather: homeWeather)
    }
    
    /// 가장 높은 온도와 낮은 온도를 찾아주는 함수
    private func findHighestTemp(dailyDummy: [DailyWeather]) -> Int {
        let highestTempArray = dailyDummy.map { $0.highestTemp }
        let maxHighestTemp = highestTempArray.max()
        print(maxHighestTemp ?? 0, "야ㅑ야야야야야야ㅑ야야")
        return maxHighestTemp ?? 0
    }
    
    private func findLowestTemp(dailyDummy: [DailyWeather]) -> Int {
        let lowestTempArray = dailyDummy.map { $0.lowestTemp }
        let minLowestTemp = lowestTempArray.min()
        print(minLowestTemp ?? 0, "야ㅑ야야야야야야ㅑ야야")

        return minLowestTemp ?? 0
    }
    
    @objc
    private func drawerButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
}


extension DetailWeatherViewController: UITableViewDelegate {}

extension DetailWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dailyWeatherDummy = WeekWeather.totalWeekDummy()[self.id].dailyWeathers
        return dailyWeatherDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailWeekTableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailWeekTableViewCell.identifier) as? DetailWeekTableViewCell else {return UITableViewCell()}
        
        let dailyWeatherDummy = WeekWeather.totalWeekDummy()[self.id].dailyWeathers
        let rowDummy = dailyWeatherDummy[indexPath.row]
        let highestTemp = findHighestTemp(dailyDummy: dailyWeatherDummy)
        let lowestTemp = findLowestTemp(dailyDummy: dailyWeatherDummy)
        
        detailWeekTableViewCell.setCurrentTemp(totalHighestTemp: highestTemp,
                                               totalLowestTemp: lowestTemp,
                                               lowestTemp: rowDummy.lowestTemp,
                                               highestTemp: rowDummy.highestTemp)
        detailWeekTableViewCell.cellDataBind(daily: rowDummy.day, weather: rowDummy.weather.icon)
        detailWeekTableViewCell.selectionStyle = .none
        return detailWeekTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
