//
//  TruthImageView.swift
//  TruthTests
//
//  Created by Melvin Asare on 20/01/2024.
//

import XCTest
@testable import Truth

class TruthImageViewTests: XCTestCase {

    func testInitialization() {
        let truthImageView = TruthImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        // Test that the view is not nil
        XCTAssertNotNil(truthImageView)

        // Test that the view has the expected corner radius
        XCTAssertEqual(truthImageView.layer.cornerRadius, 8)

        // Test that masksToBounds is set to true
        XCTAssertTrue(truthImageView.layer.masksToBounds)

        // Test that the border color is set to black
        XCTAssertEqual(truthImageView.layer.borderColor, UIColor.black.cgColor)

        // Test that the border width is set to 1
        XCTAssertEqual(truthImageView.layer.borderWidth, 1)

        // Test that translatesAutoresizingMaskIntoConstraints is set to false
        XCTAssertFalse(truthImageView.translatesAutoresizingMaskIntoConstraints)
    }
}
