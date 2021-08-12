//
//  TrafficProtocol.swift
//  TrafficApp
//
//  Created by Leon on 22/7/21.
//

import Foundation

protocol TrafficDelegate {
    func getTrafficData(data: [Traffic])
}

protocol DataHelperDelegate {
    func dataHelperDidFailure(message: String)
}
