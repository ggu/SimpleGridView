//
//  SimpleGridViewUITests.swift
//  SimpleGridViewUITests
//
//  Created by Gabriel Uribe on 11/25/15.
//

import XCTest

@testable import SimpleGridView

class SimpleGridViewUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTouches() {

      
      let element = XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(1)
      
      let tile1 = element.childrenMatchingType(.Other).elementBoundByIndex(8)
      let tile2 = element.childrenMatchingType(.Other).elementBoundByIndex(76)
      let tile3 = element.childrenMatchingType(.Other).elementBoundByIndex(38)
      
      tile1.tap()
      tile2.tap()
      tile3.tap()
    }
}
