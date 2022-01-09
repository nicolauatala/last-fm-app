@testable import lastfm
import XCTest

final class HomeViewModelTests: XCTestCase {

	private var sut: HomeViewModel?
	private var service: MockHomeService?
	private var coordinatorDelegate: MockHomeCoordinator?

	override func setUpWithError() throws {
		service = MockHomeService()
		coordinatorDelegate = MockHomeCoordinator()
		sut = HomeViewModel(service: service!, coordinatorDelegate: coordinatorDelegate!)
	}

	func testShouldgetTopAlbumsFromServe() {
		sut?.getTopAlbums()
		XCTAssertEqual(1, sut?.albums.currentValue.count)
	}

	func testShouldShowAlbumDetailView() {
		sut?.getTopAlbums()
		sut?.albumDetail(with: 0)
		XCTAssertTrue(coordinatorDelegate!.presentedDetail)
	}
}


class MockHomeCoordinator: Coordinator, HomeViewModelCoordinatorDelegate {
	var presentedDetail = false

	func albumDetail(_ with: Album) {
		presentedDetail = true
	}

	func start() {}
}
