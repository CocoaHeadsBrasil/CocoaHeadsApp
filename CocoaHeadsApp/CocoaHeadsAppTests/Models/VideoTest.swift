import XCTest
@testable import CocoaHeadsApp

class VideoTest: XCTestCase {

    func testInitializerWithDictionary() {
        let video = Video(dictionary: jsonObjectWithName("video"))
    
        XCTAssertEqual(11, video.id)
        XCTAssertEqual(8, video.speakerId)
        XCTAssertEqual(76, video.agendaId)
        XCTAssertEqual("Apresentação do 2º CocoaHeads BNU na íntegra", video.title)
        XCTAssertEqual("<p>No dia 26 de maio &agrave;s 19h, foi a vez do 2&ordm; CocoaHeads BNU, realizado no audit&oacute;rio do SENAI Blumenau.</p>", video.description)
        XCTAssertEqual("K966T0HdED8", video.youtubeId)
        XCTAssertTrue(video.published!)
        XCTAssertEqual(["SpriteKit", "Auto-layout", "Hibrido", "Nativo", "Push", "Parse", "Notifications", "Notificações", "Jogos", "VFL"], video.tags)
    }
    
    func testYoutubeURLIfItHasNotAnYoutubeId() {
        let video = Video()
        XCTAssertNil(video.youtubeURL)
    }
    
    func testYoutubeURLIfItHasAnYoutubeId() {
        let video = Video()
        video.youtubeId = "XPTO123456"
        XCTAssertEqual("https://www.youtube.com/watch?v=XPTO123456", video.youtubeURL?.absoluteString)
    }
}