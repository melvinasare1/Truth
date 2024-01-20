//
//  HeaderViewCellTests.swift
//  TruthTests
//
//  Created by Melvin Asare on 20/01/2024.
//

import XCTest
@testable import Truth

class HeaderViewTests: XCTestCase {

    func testInitialization() {
        let headerView = HeaderView()

        // Test that the view is not nil
        XCTAssertNotNil(headerView)

        // Test that translatesAutoresizingMaskIntoConstraints is set to false
        XCTAssertFalse(headerView.translatesAutoresizingMaskIntoConstraints)

        // Test that the popularTitle is a subview of headerView
//        XCTAssertTrue(headerView.subviews.contains(headerView.popularTitle))
//
//        // Test that the popularTitle's text alignment is set to left
//        XCTAssertEqual(headerView.popularTitle.textAlignment, .left)
//
//        // Test that the popularTitle's title text is set to "Popular"
//        XCTAssertEqual(headerView.popularTitle.titleText, "Popular")
//
//        // Test that the popularTitle's title size is configured correctly
//        XCTAssertEqual(headerView.popularTitle.fontSize, 24)
//        XCTAssertEqual(headerView.popularTitle.weight, .black)

        // Test that the constraints are set up correctly
        XCTAssertNotNil(headerView.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(headerView.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(headerView.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
    }
}
