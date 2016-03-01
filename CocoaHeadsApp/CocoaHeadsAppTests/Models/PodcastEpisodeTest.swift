import XCTest
@testable import CocoaHeadsApp

class PodcastEpisodeTest: XCTestCase {
    
    func testInitializerWithDictionary() {
        let episode = PodcastEpisode.withJSON(jsonObjectWithName("podcast_episode"))!
        
        XCTAssertEqual(15, episode.id)
        XCTAssertEqual("S02E03 - Entrevista: OLX", episode.title)
        XCTAssertEqual("Mais uma semana com entrevistas sobre desenvolvimento iOS no podcast da CocoaHeads!", episode.description)
        XCTAssertEqual("247347819", episode.soundcloudId)
        XCTAssertEqual("http://soundcloud.com/cocoaheadsbr/s02e03-entrevista-olx", episode.soundcloudURL)
        XCTAssertEqual(["OLX", "iPhone", "Xcode", "Apple", "Swift", "Cocoaheads"], episode.tags)
    }
}
