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
    
    func testNormalMessageSpliting() {
        let message = "I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself."
        MessageSplitting.split(message: message, size: 50) { (messages, error) in
            for mess in messages {
                XCTAssertTrue(mess.count <= 50, "'\(mess)' got length greater than 50. All the message's lengths must be lower than 50")
            }
        }
    }
    
    func testErrorCase() {
        let message = "Ican`tbelieveTweeternowsupportschunkingmymessages,soIdon`thavetodoitmyself."
        MessageSplitting.split(message: message, size: 50) { (messages, error) in
            XCTAssertTrue(StringUtils.isEmpty(string: error) == false, "The error should appear with this test case")
        }
    }
    
    func testVeryLongMessage() {
        let message = "I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don`t have to do it myself."
        MessageSplitting.split(message: message, size: 50) { (messages, error) in
            for mess in messages {
                XCTAssertTrue(mess.count <= 50, "'\(mess)' got length greater than 50. All the message's lengths must be lower than 50")
            }
        }
    }
    
    func testShortMessage() {
        let message = "I can`t believe"
        MessageSplitting.split(message: message, size: 50) { (messages, error) in
            for mess in messages {
                XCTAssertTrue(mess == message, "Result message should be the same as input message")
            }
        }
    }
    
    func testEmptyMessage() {
        let message = ""
        MessageSplitting.split(message: message, size: 50) { (messages, error) in
            XCTAssertTrue(messages.count == 0, "Result list should be zero count")
        }
    }
}
