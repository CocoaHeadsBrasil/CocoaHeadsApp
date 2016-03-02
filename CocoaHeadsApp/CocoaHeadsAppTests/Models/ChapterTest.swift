import XCTest
@testable import CocoaHeadsApp

class ChapterTest: XCTestCase {

    func testInitializerWithDictionary() {
        let chapter = Chapter.withJSON(jsonObjectWithName("chapter"))!
     
        XCTAssertEqual(22, chapter.id)
        XCTAssertEqual(1, chapter.stateId)
        XCTAssertEqual("Rio Branco", chapter.city)
        XCTAssertEqual("riobranco@cocoaheads.com.br", chapter.email)
        XCTAssertEqual("Comunidade de desenvolvedores iOS/MacOS de Rio Branco", chapter.description)
        XCTAssertTrue(chapter.published)
        XCTAssertEqual("João da Silva", chapter.organizer)
        XCTAssertEqual("joao@dasilva.com", chapter.organizerEmail)
        XCTAssertEqual("6881888888", chapter.organizerPhone)
        XCTAssertEqual("http://cocoaheads.com.br", chapter.website?.absoluteString)
        XCTAssertEqual("https://github.com/CocoaHeadsBrasil/", chapter.githubURL?.absoluteString)
        XCTAssertEqual("https://twitter.com/cocoaheadsbr/", chapter.twitterURL?.absoluteString)
        XCTAssertEqual("https://www.facebook.com/CocoaHeadsBrasil/", chapter.facebookURL?.absoluteString)
    }
}
