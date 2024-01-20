//
//  TruthLabelTests.swift
//  TruthTests
//
//  Created by Melvin Asare on 17/01/2024.
//

import XCTest
import XCTest

@testable import Truth

class TruthLabelTests: XCTestCase {

    var truthLabel: TruthLabel!

    override func setUp() {
        super.setUp()
        truthLabel = TruthLabel()
    }

    override func tearDown() {
        truthLabel = nil
        super.tearDown()
    }

    func testConfigureTitleSize() {
        truthLabel.configureTitleSize(fontSize: 20.0, weight: .bold)
        XCTAssertEqual(truthLabel.font, UIFont.systemFont(ofSize: 20.0, weight: .bold))
    }

    func testConfigureTitleColor() {
        truthLabel.configureTitleColor(color: .red)
        XCTAssertEqual(truthLabel.textColor, .red)
    }

    func testConfigureText() {
        truthLabel.configureText(textAlignment: .center, titleText: "Hello, World!")
        XCTAssertEqual(truthLabel.textAlignment, .center)
        XCTAssertEqual(truthLabel.text, "Hello, World!")
    }

    func testDefaultValues() {
        XCTAssertEqual(truthLabel.minimumScaleFactor, 0.8999999761581421)
        XCTAssertEqual(truthLabel.numberOfLines, 0)
        XCTAssertEqual(truthLabel.textColor, .darkGray)
        XCTAssertTrue(truthLabel.adjustsFontSizeToFitWidth)
        XCTAssertFalse(truthLabel.translatesAutoresizingMaskIntoConstraints)
    }
}
