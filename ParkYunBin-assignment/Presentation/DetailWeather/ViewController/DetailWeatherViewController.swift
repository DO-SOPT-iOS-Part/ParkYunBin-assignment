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
    private var sectionHeaderView: DetailCardHeaderView?
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
        detailWeatherView.dailyWeekWeatherTableView.register(DetailCardTableViewCell.self,
                                                             forCellReuseIdentifier: DetailCardTableViewCell.identifier)

    }
    
    func detailDataBind(homeWeather: HomeWeather, id: Int) {
        self.id = id
        detailWeatherView.detailTopView.dataBind(homeWeather: homeWeather)
    }
    
    /// 가장 높은 온도와 낮은 온도를 찾아주는 함수
    private func findHighestTemp(dailyDummy: [DailyWeather]) -> Int {
        let highestTempArray = dailyDummy.map { $0.highestTemp }
        let maxHighestTemp = highestTempArray.max()
        return maxHighestTemp ?? 0
    }
    
    private func findLowestTemp(dailyDummy: [DailyWeather]) -> Int {
        let lowestTempArray = dailyDummy.map { $0.lowestTemp }
        let minLowestTemp = lowestTempArray.min()
        return minLowestTemp ?? 0
    }
    
    @objc
    private func drawerButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
}


extension DetailWeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let detailCardHeaderView = DetailCardHeaderView()
            sectionHeaderView = detailCardHeaderView
            return detailCardHeaderView
            
        case 1:
            return DetailDailyTableHeaderView()
            
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 66
        case 1:
            return 38
        default:
            return 0
        }
    }
}

extension DetailWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            let dailyWeatherDummy = WeekWeather.totalWeekDummy()[self.id].dailyWeathers
            return dailyWeatherDummy.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let detailCardTableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailCardTableViewCell.identifier) as? DetailCardTableViewCell else {return UITableViewCell()}
            guard let idMatchedData = DetailWeather.totalDummy().first(where: {$0.id == self.id}) else { return UITableViewCell() }
            detailCardTableViewCell.dataBind(data: idMatchedData.timeLine)
            return detailCardTableViewCell
        case 1:
            guard let detailWeekTableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailWeekTableViewCell.identifier) as? DetailWeekTableViewCell else {return UITableViewCell()}
            
            let dailyWeatherDummy = WeekWeather.totalWeekDummy()[self.id].dailyWeathers
            let rowDummy = dailyWeatherDummy[indexPath.row]
            let highestTemp = findHighestTemp(dailyDummy: dailyWeatherDummy)
            let lowestTemp = findLowestTemp(dailyDummy: dailyWeatherDummy)
            
            detailWeekTableViewCell.setCurrentTemp(totalHighestTemp: highestTemp,
                                                   totalLowestTemp: lowestTemp,
                                                   lowestTemp: rowDummy.lowestTemp,
                                                   highestTemp: rowDummy.highestTemp)
            
            detailWeekTableViewCell.cellDataBind(daily: rowDummy.day,
                                                 weather: rowDummy.weather.icon)
            
            return detailWeekTableViewCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 55
        } else if indexPath.section == 0 {
            return 146
        } else {
            return 0
        }
    }
}

extension DetailWeatherViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         if scrollView === detailWeatherView.dailyWeekWeatherTableView {
             let sectionHeaderHeight: CGFloat = 55 // 섹션 헤더의 높이를 설정
             if scrollView.contentOffset.y >= sectionHeaderHeight {
                 // 스크롤이 섹션 헤더의 높이 이상 내려갔을 때 섹션 헤더의 스타일을 변경
                 sectionHeaderView?.isScrolled = true
             } else {
                 // 스크롤이 섹션 헤더의 높이 이하로 올라갔을 때
                 sectionHeaderView?.isScrolled = false
             }
         }
     }
}
