//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Shyngys Saktagan on 5/15/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
