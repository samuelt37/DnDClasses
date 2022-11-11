//
//  ClassListTest.swift
//  DnDClassesTests
//
//  Created by Samuel Tse on 11/9/22.
//

import XCTest

@testable import DnDClasses
class ClassListTest: XCTestCase {
    var viewModel: ClassListViewModel!
    
    override func setUp() {
        viewModel = .init()
        super.setUp()
    }
    
    func testCanParseClasses() {
        let json = "{\"index\":\"barbarian\",\"name\":\"Barbarian\",\"url\":\"/api/classes/barbarian\"}"
        let jsonData = json.data(using: .utf8)
        let dndClass = try! JSONDecoder().decode(DnDClass.self, from: jsonData!)
        
        XCTAssertEqual(dndClass.name, "Barbarian")
    }
}
