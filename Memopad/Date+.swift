//
//  Date+.swift
//  Memopad
//
//  Created by 松田結衣 on 2018/08/20.
//  Copyright © 2018年 YuiMatsuda. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    var year: Int? {
        let yearFormat = DateFormatter()
        yearFormat.locale = Locale(identifier: "ja_JP")
        yearFormat.dateFormat = "yyyy"
        return Int(yearFormat.string(from: self))
    }
    
    var month: Int? {
        let yearFormat = DateFormatter()
        yearFormat.locale = Locale(identifier: "ja_JP")
        yearFormat.dateFormat = "M"
        return Int(yearFormat.string(from: self))
    }
    
    var day: Int? {
        let yearFormat = DateFormatter()
        yearFormat.locale = Locale(identifier: "ja_JP")
        yearFormat.dateFormat = "d"
        return Int(yearFormat.string(from: self))
    }

}
