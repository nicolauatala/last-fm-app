@testable import lastfm
import XCTest

final class HomeViewModelTests: XCTestCase {

	private var sut: HomeViewModel?
	private var service: MockHomeService?

	override func setUpWithError() throws {
		service = MockHomeService()
		sut = HomeViewModel(service: service!)
	}

	func testShouldgetTopAlbumsFromServe() {
		sut?.getTopAlbums()
		XCTAssertNotNil(sut?.topAlbums)
	}

}
