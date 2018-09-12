//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by VuongTC on 9/11/18.
//  Copyright © 2018 Home. All rights reserved.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMessageSpliting() {
        let message = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        MessageSplitting.split(message: message) { (messages) in
            for mess in messages {
                XCTAssertTrue(mess.count <= 50, "'\(mess)' got length greater than 50. All the message's lengths must be lower than 50")
            }
        }
    }
}
