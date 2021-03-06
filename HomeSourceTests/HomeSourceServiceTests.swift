//
//  HomeSourceServiceTests.swift
//  HomeSource
//
//  Created by Gary Butcher on 21/04/2016.
//  Copyright © 2016 Apadmi. All rights reserved.
//

import XCTest

class HomeSourceServiceTests: XCTestCase {
    
    let service = HomeSourceService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserInitalisesAsNull() {
        XCTAssertNil(service.getUser())
    }
    
    func testGetCampaignsReturnsData() {
        service.getCampaigns({campaigns, error in
            
            //print all campaigns
            if let campaigns = campaigns {
                for campaign in campaigns {
                    print("Campaign = "+campaign.title);
                    
                    print("Goals")
                    for goal in campaign.goals {
                        print(goal.getCurrentString() + " - " + String(goal.getPercentageOfGoal() * 100.0) )
                    }
                }
                XCTAssertTrue(campaigns.count > 0)
            } else {
                XCTFail()
            }
        })
    }
    
    /*func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }*/
    
}
