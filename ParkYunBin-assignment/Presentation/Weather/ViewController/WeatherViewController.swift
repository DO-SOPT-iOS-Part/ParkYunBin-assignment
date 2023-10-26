//
//  WeatherViewController.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/15.
//

import UIKit

class WeatherViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var filter = [HomeWeather]()
    
    // MARK: - UI Components
    
    private var weatherView = WeatherView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        
    }
    
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
    
    private func delegate() {
        weatherView.searchBar.delegate = self
    }
    
    // 매개변수로 들어온 단어를 기준으로 StackView에 필터링한 결과들 넣어주는 함수
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        weatherView.listStackView.removeAllArrangedSubviews()
        
        filter =  HomeWeather.dummyWeather().filter({(location: HomeWeather) -> Bool in
            return location.position.lowercased().contains(searchText.lowercased())
        })
        
        filter.forEach {
            let list = WeatherBlockView(homeWeahter: $0)
            weatherView.listStackView.addArrangedSubview(list)
        }
    }
    
    // 전체 데이터 리스트 불러오기
    func showTotalList() {
        weatherView.listStackView.removeAllArrangedSubviews()
        HomeWeather.dummyWeather().forEach {
            let list = WeatherBlockView(homeWeahter: $0)
            weatherView.listStackView.addArrangedSubview(list)
        }
    }
}

// MARK: - UISearchBarDelegate

extension WeatherViewController: UISearchBarDelegate {
    // textField의 text가 변화할 때 마다 호출
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            showTotalList()
        } else {
            filterContentForSearchText(weatherView.searchBar.text ?? String())
        }
    }
    
    // 서치바 검색이 끝났을 때 호출
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            showTotalList()
            self.weatherView.searchBar.resignFirstResponder()
        } else {
            filterContentForSearchText(weatherView.searchBar.text ?? String())
        }
    }
}
