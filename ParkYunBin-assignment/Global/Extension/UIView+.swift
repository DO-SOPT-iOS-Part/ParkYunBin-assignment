//
//  UIView+.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/16.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
