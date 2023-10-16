//
//  BaseView.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/16.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        // override Point
        
    }
    
    func setLayout() {
        // override Point
    }
}

