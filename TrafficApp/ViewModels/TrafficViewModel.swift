//
//  TrafficViewModel.swift
//  TrafficApp
//
//  Created by Leon on 22/7/21.
//

import Foundation

class TrafficViewModel {
    let apiService = APIService()
    var delegate: TrafficDelegate?
    var trafficData: [Traffic] = [] {
        didSet {
            self.delegate?.getTrafficData(data: trafficData)
        }
    }
    
    func getTrafficImages() {
        apiService.fetchTrafficImages { (data) in
            if let data = data as? [Traffic] {
                self.trafficData = data
            }
        }
    }
}
