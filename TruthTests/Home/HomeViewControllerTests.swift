//
//  HomeViewControllerTests.swift
//  TruthTests
//
//  Created by Melvin Asare on 20/01/2024.
//

import XCTest
@testable import Truth
class HomeViewControllerTests: XCTestCase {
    var sut: HomeViewController!

    override func setUp() {
        super.setUp()
        // Create an instance of HomeViewModel for testing (you might need to mock it)
        let viewModel = HomeViewModel()
        sut = HomeViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCollectionViewHasDataSource() {
        XCTAssertNotNil(sut.baseCollectionView.dataSource)
    }

    func testCollectionViewConformsToDelegate() {
        XCTAssertNotNil(sut.baseCollectionView.delegate)
        XCTAssertTrue(sut.conforms(to: UICollectionViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:didSelectItemAt:))))
    }

    func testCollectionViewHasExpectedNumberOfSections() {
        let numberOfSections = sut.numberOfSections(in: sut.baseCollectionView)
        XCTAssertEqual(numberOfSections, 4)
    }

    func testCollectionViewHasExpectedNumberOfItemsInSection() {
        let numberOfItems = sut.collectionView(sut.baseCollectionView, numberOfItemsInSection: 0)
        XCTAssertEqual(numberOfItems, 5)
    }

    func testCollectionViewCellForRow() {
        let cell = sut.collectionView(sut.baseCollectionView, cellForItemAt: IndexPath(item: 0, section: 0))

        XCTAssertTrue(cell is ArticleHorizontalSliderCell)
    }

    func testCollectionViewDidSelectItemAt() {
        // Assuming there is an article at IndexPath(item: 0, section: 0)
        sut.collectionView(sut.baseCollectionView, didSelectItemAt: IndexPath(item: 0, section: 0))

        // You might want to assert that the navigation controller is pushed to the expected view controller
        // You can check the presented view controller, navigation stack, etc.
        // Example: XCTAssertNotNil(sut.navigationController?.topViewController as? ExpectedViewController)
    }

    // Add more tests as needed for your specific functionality
}

