//
//  DateHelper.swift
//  TrafficApp
//
//  Created by Leon on 22/7/21.
//

import Foundation


class DateHelper {
    func getLocalDateTimeString() -> String {
        let currentDateTime = Date()
        let dateFormat = DateFormatter()

        dateFormat.timeZone = .current
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let dateString = dateFormat.string(from: currentDateTime)
        
        return dateString
    }
}
