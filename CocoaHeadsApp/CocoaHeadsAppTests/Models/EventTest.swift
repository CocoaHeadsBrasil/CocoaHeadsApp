import XCTest
import CoreLocation
@testable import CocoaHeadsApp

class EventTest: XCTestCase {

    func testInitializerWithDictionary() {
        let event = Event(dictionary: jsonObjectWithName("event"))
        XCTAssertEqual(125, event.id)
        XCTAssertEqual("4º Cocoaheads Florianópolis", event.name)
        XCTAssertEqual("<p>Ol&aacute; pessoal est&aacute; na hora do primeiro CocoaHeads Floripa de 2016!</p>", event.description)
        XCTAssertEqual(21, event.chapter?.id)
        // date
        XCTAssertEqual("SENAI SC 401", event.venue)
        XCTAssertEqual("Rod. SC 401, 3730", event.address)
        
        let expectedCoodinate = CLLocationCoordinate2D(latitude: -27.548005, longitude: -48.497775)
        XCTAssertEqual(expectedCoodinate.latitude, event.location?.latitude)
        XCTAssertEqual(expectedCoodinate.longitude, event.location?.longitude)
        XCTAssertEqual("", event.passbook)
        XCTAssertTrue(event.published!)
        XCTAssertEqual("http://www.meetup.com/CocoaHeads-Florianopolis/events/228917154/", event.meetupURL?.absoluteString)
    }
}
