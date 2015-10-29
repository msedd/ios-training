//
//  FlashcardUITests.swift
//  FlashcardUITests
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import XCTest

class FlashcardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.navigationBars["Flashcards"].buttons["Add"].tap()
        
        app.tables.staticTexts["Download"].tap()
        app.tables.staticTexts["по-русски / Deutsch"].tap()
        app.tables.staticTexts["по-русски / Deutsch"].tap()
        
    }
    
}
