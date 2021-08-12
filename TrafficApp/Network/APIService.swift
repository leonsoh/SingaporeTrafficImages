//
//  NetworkHandler.swift
//  TrafficApp
//
//  Created by Leon on 22/7/21.
//

import Foundation
import UIKit

class APIService {
    let session = URLSession(configuration: .default)
    var delegate: DataHelperDelegate?
    
    func fetchTrafficImages(completion: @escaping (AnyObject) -> Void) {
        var request: URLRequest?
        let endPoint = "?date_time="
        let dateHelper = DateHelper()
        let dateTime = dateHelper.getLocalDateTimeString()
        
        var listOfTraffics: [Traffic] = []
        
        if let url = URL(string: URLs.trafficImagesURL + endPoint + dateTime) {
            request = URLRequest(url: url)
        }
        
        request?.httpMethod = HttpMethods.GET
        
        if let request = request {
            let task = session.dataTask(with: request) { (data, response, error) in
                guard let _: Data = data, let _: URLResponse = response, error == nil else {
                    return
                }
                
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    
                    if let dict = json as? NSDictionary {
                        if let message = dict.value(forKey: "message") as? String {
                            self.delegate?.dataHelperDidFailure(message: message)
                        }
                        
                        if let items = dict.value(forKey: "items") as? NSArray {
                            if let cameras = items.value(forKey: "cameras") as? NSArray {
                                for camera in cameras {
                                    if let traffics = camera as? NSArray {
                                        for traffic in traffics {
                                            if let trafficDict = traffic as? NSDictionary {
                                                if let location = trafficDict.value(forKey: "location") as? NSDictionary {
                                                    if let latitude = location.value(forKey: "latitude") as? Double,
                                                       let longitude = location.value(forKey: "longitude") as? Double,
                                                       let cameraId = trafficDict.value(forKey: "camera_id") as? String,
                                                       let image = trafficDict.value(forKey: "image") as? String {
                                                        
                                                        let trafficData = Traffic(cameraId: cameraId, imageUrl: image, latitude: latitude, longitude: longitude)
                                                        listOfTraffics.append(trafficData)
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        completion(listOfTraffics as AnyObject)
                    } else {
                        NSLog("Error!")
                    }
                }
            }
            task.resume()
        } else {
            NSLog("request error")
        }
    }
}

