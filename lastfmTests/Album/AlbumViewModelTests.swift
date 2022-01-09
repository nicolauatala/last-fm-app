@testable import lastfm
import XCTest

final class AlbumViewModelTests: XCTestCase {
	private var sut: AlbumViewModel?
	private var service: MockAlbumService?

	override func setUpWithError() throws {
		service = MockAlbumService()
		sut = AlbumViewModel(service: service!, album: MockAlbumService.newAlbum)
	}

	func testShouldHaveTheSameAlbumNameFromInit() {
		XCTAssertEqual("My test album", sut?.album.name)
	}

	func testGetInfoFromService() {
		XCTAssertNil(sut?.details.currentValue)
		sut?.getInfo()
		XCTAssertNotNil(sut?.details.currentValue)
	}
}
