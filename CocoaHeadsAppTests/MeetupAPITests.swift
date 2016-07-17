import XCTest
import Moya
@testable import CocoaHeadsApp

class MeetupAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMeetupAPI() {
        let api:MeetupAPI = .ListEvents(perPage: 20, pageOffset: 0)
        let baseURL = NSURL(string:"https://api.meetup.com/2")
        
        XCTAssertEqual(api.baseURL, baseURL)
        XCTAssertEqual(api.path, "/events")
        XCTAssertEqual(api.method, Moya.Method.GET)
        
        guard let apiParameters = api.parameters else {
            XCTAssertTrue(false, "Parameters should be available")
            return
        }
        
        let parameters = ["sign":"true",
            "photo-host":"public",
            "page":"\(20)",
            "offset":"\(0)",
            "group_urlname":"AppsterdamBR",
            "fields":["venue", "headcount", "photo_url"].joinWithSeparator(",")]
        
        for (key, value) in apiParameters {
            guard let stringValue = value as? String else {
                XCTAssertTrue(false, "\(key):\(value) is an invalid parameter")
                return
            }
            XCTAssertEqual(parameters[key], stringValue)
        }
    }
    
}
