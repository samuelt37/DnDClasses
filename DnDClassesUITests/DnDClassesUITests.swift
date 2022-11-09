//
//  DnDClassesUITests.swift
//  DnDClassesUITests
//
//  Created by Samuel Tse on 11/4/22.
//

import XCTest

class DnDClassesUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let tablesQuery = app.tables
        XCTAssertTrue(tablesQuery.element.exists)
        
        let barbCell = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Barbarian"]/*[[".cells[\"Barbarian\"].buttons[\"Barbarian\"]",".buttons[\"Barbarian\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(barbCell.exists)
        barbCell.tap()
        
        let noSpells = app.staticTexts["No spells found."]
        XCTAssertTrue(noSpells.exists)
        noSpells.tap()
        
        let backButton = app.navigationBars["Barbarian Spells"].buttons["Classes"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
        
        
        let bardCell = tablesQuery.buttons["Bard"]
        XCTAssertTrue(bardCell.exists)
        bardCell.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
