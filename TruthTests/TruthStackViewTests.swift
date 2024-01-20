//
//  TruthStackViewTests.swift
//  truthTests
//
//  Created by Melvin Asare on 24/12/2023.
//

import XCTest
@testable import Truth

class TruthStackViewTests: XCTestCase {

    var truthStackView: TruthStackView!

    override func setUp() {
        super.setUp()
        truthStackView = TruthStackView()
    }

    override func tearDown() {
        truthStackView = nil
        super.tearDown()
    }

    func testConfigureStackView() {
        truthStackView.configure(distribution: .fill, axis: .horizontal, spacing: 10.0)
        XCTAssertEqual(truthStackView.axis, .horizontal)
        XCTAssertEqual(truthStackView.spacing, 10.0)
        XCTAssertEqual(truthStackView.distribution, .fill)
    }
}
