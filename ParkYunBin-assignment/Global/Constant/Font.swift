//
//  Font.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/10/16.
//

import UIKit

enum AppFontName: String {
    
    case regularFont = "SFProDisplay-Regular"
    case mediumFont = "SFProDisplay-Medium"
    case boldFont = "SFProDisplay-Bold"
    case thinFont = "SFProDisplay-Thin"
    case lightFont = "SFProDisplay-Light"
    
    var name: String {
        return self.rawValue
    }
}
