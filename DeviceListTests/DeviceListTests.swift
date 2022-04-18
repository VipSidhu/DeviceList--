//
//  DeviceListTests.swift
//  DeviceListTests
//
//  Created by vipan sidhu on 2022-04-17.
//

import XCTest
@testable import DeviceList

class DeviceListTests: XCTestCase {

    override func setUpWithError() throws {
        getFilterValue()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func getFilterValue(){
            struct DeviceObj {
                var Id = Int(),
                    type = String(),
                    Price = Int(),
                    Currency = String(),
                    isFavorite = Bool(),
                    imageUrl = String(),
                    Title = String(),
                    Description = String(),
                    review = Double(),
                    size = String(),
                    OS = String()
                    
            }
            var DeviceArr = [DeviceObj]()
            DeviceArr.append(DeviceObj(Id: 01, type: "Nokia X2", Price: 10, Currency: "USD", isFavorite: true, imageUrl: "", Title: "", Description: "Available", review: 4.0, size: "160 * 160", OS: "Android"))
            let filter = DeviceArr.filter({
                $0.type == "Nokia X2" || $0.OS == "Android"
                
            })
            XCTAssertEqual(filter.first?.type, DeviceArr[0].type)
        }

}
