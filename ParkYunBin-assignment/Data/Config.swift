//
//  Config.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/17.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
