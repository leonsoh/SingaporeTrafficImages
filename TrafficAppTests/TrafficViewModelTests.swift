//
//  TrafficViewModelTests.swift
//  TrafficAppTests
//
//  Created by Leon on 23/7/21.
//

import XCTest
@testable import TrafficApp

class TrafficViewModelTests: XCTestCase {
    let viewModel = TrafficViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasTraffics() {
        viewModel.getTrafficImages()
        XCTAssertTrue(viewModel.trafficData.count > 0)
    }
    
    func testImageUrlEqualsToString() {
        let traffic = Traffic(cameraId: "", imageUrl: "https://images.data.gov.sg/api/traffic-images/", latitude: 11, longitude: 1.3)
        
        XCTAssertEqual(traffic.imageUrl, "https://images.data.gov.sg/api/traffic-images/")
    }
    
    
    func testLatitudeNotEmpty() throws {
        let data = Traffic(cameraId: "", imageUrl: "", latitude: 12.3, longitude: 13)
        viewModel.trafficData.append(data)
     
        let latitude = try XCTUnwrap(viewModel.trafficData.map{$0.latitude})
        
        XCTAssertFalse(latitude.isEmpty)
    }

}
