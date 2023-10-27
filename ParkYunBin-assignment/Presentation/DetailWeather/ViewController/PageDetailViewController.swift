//
//  PageDetailViewController.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/27.
//

import UIKit

class PageDetailViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private lazy var pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                               navigationOrientation: .horizontal,
                                                               options: nil)
    private lazy var dataViewControllers: [DetailWeatherViewController] = []
    private var id = 0
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllerList()
        setupDelegate()
        
        
        
        pageViewController.setViewControllers([dataViewControllers[id]],
                                              direction: .forward,
                                              animated: true,
                                              completion: nil)
    }
    
    // MARK: - Override Functions
    
    override func hieararchy() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
    }

    override func setLayout() {
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageViewController.didMove(toParent: self)
    }
    
    override func setButtonEvent() {

    }
    
    private func setupDelegate() {
            pageViewController.dataSource = self
            pageViewController.delegate = self
        }
    
    private func setViewControllerList() {
        HomeWeather.dummyWeather().forEach {
            let vc = DetailWeatherViewController()
            vc.detailDataBind(homeWeather: $0, id: $0.id)
            dataViewControllers.append(vc)
        }
    }
    
    func dataBind(id: Int) {
        self.id = id
    }
}

extension PageDetailViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController as! DetailWeatherViewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController as! DetailWeatherViewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
}
