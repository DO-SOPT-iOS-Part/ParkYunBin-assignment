//
//  UIStackView+.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/18.
//

import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
    
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { subview in
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
}
