//
//  TruthButtonTests.swift
//  TruthTests
//
//  Created by Melvin Asare on 17/01/2024.
//

import XCTest
@testable import Truth

class TruthButtonTests: XCTestCase {

    var truthButton: TruthButton!

    override func setUp() {
        super.setUp()
        truthButton = TruthButton()
    }

    override func tearDown() {
        truthButton = nil
        super.tearDown()
    }

    func testConfigureButtonWithTitleAndColor() {
        truthButton.configure(text: "Test Button", color: .red)
        XCTAssertEqual(truthButton.currentTitle, "Test Button")
        XCTAssertEqual(truthButton.titleColor(for: .normal), .red)
    }

    func testConfigureBackground() {
        truthButton.configureBackground(background: .green)
        XCTAssertEqual(truthButton.backgroundColor, .green)
    }

    func testConfigureBorder() {
        truthButton.configureBoarder(borderColor: UIColor.black.cgColor, borderWidth: 2.0)
        XCTAssertEqual(truthButton.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(truthButton.layer.borderWidth, 2.0)
    }

    func testSetFilledButton() {
        truthButton.setFilledButton(color: .yellow)
        XCTAssertEqual(truthButton.backgroundColor, .yellow)
        XCTAssertEqual(truthButton.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(truthButton.layer.borderWidth, 0.5)
    }

    func testSetOutlinedButton() {
        truthButton.setOutlinedButton()
        XCTAssertEqual(truthButton.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(truthButton.layer.borderWidth, 0.5)
        XCTAssertEqual(truthButton.backgroundColor, .white)
    }

    func testSetUnfilledButton() {
        truthButton.setUnfilledButton()
        XCTAssertEqual(truthButton.backgroundColor, .clear)
        XCTAssertEqual(truthButton.layer.borderWidth, 0)
    }

    func testVariantFilled() {
        truthButton.variant(variant: .filled)
        XCTAssertEqual(truthButton.backgroundColor, .systemBlue)
        XCTAssertEqual(truthButton.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(truthButton.layer.borderWidth, 0.5)
    }

    func testVariantOutline() {
        truthButton.variant(variant: .outline)
        XCTAssertEqual(truthButton.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(truthButton.layer.borderWidth, 0.5)
        XCTAssertEqual(truthButton.backgroundColor, .white)
    }

    func testVariantUnfilled() {
        truthButton.variant(variant: .unfilled)
        XCTAssertEqual(truthButton.backgroundColor, .clear)
        XCTAssertEqual(truthButton.layer.borderWidth, 0)
    }

    // Add more tests for other functionalities as needed
}
