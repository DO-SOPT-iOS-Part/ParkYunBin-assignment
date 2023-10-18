//
//  Size.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/18.
//

import UIKit

struct Size {
    // MARK: 디바이스 width
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // MARK: 디바이스 height
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var qrFocusZone: CGRect {
        return CGRect(x: (Size.width - 200) / 2 , y: (Size.height - 200) / 2, width: 200, height: 200)
    }
}
