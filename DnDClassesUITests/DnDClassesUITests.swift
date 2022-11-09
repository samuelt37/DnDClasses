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
        
        let navigationTitle = app.navigationBars["Classes"].staticTexts["Classes"]
        XCTAssertTrue(navigationTitle.exists)
        navigationTitle.tap()
        
        let tablesQuery = app.tables
        XCTAssertTrue(tablesQuery.element.exists)
        
        let barbarianbutton = tablesQuery.buttons["Barbarian"]
        XCTAssertTrue(barbarianbutton.exists)
        barbarianbutton.tap()
        
        let barbResult = app.staticTexts["No spells found."]
        XCTAssertTrue(barbResult.exists)
        barbResult.tap()
        
        let barbTitle = app.navigationBars["Barbarian Spells"].buttons["Classes"]
        XCTAssertTrue(barbTitle.exists)
        barbTitle.tap()
        
        let bardButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Bard"]/*[[".cells[\"Bard\"].buttons[\"Bard\"]",".buttons[\"Bard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(bardButton.exists)
        bardButton.tap()
        
//        tablesQuery.cells["Light, You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action.\nIf you target an object held or worn by a hostile creature, that creature must succeed on a dexterity saving throw to avoid the spell."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
