import XCTest
import Moya
import OHHTTPStubs
@testable import CocoaHeadsApp

class APIConsumerTests: XCTestCase {
    
    lazy var apiTarget:MeetupAPI = {
        return MeetupAPI.ListEvents(perPage: 20, pageOffset: 0)
    }()
    
    lazy var consumer:APIConsumer<MeetupAPI> = {
        return APIConsumer(MoyaProvider<MeetupAPI>())
    }()
    
    func defaultFailureCheck(expectation:XCTestExpectation) -> (ErrorType -> Void) {
        return { (error) -> Void in
            expectation.fulfill()
            XCTAssertTrue(false, "The application should be able to download the event list")
        }
    }
    
    func testAPIConsumer() {
        
        let expectation = self.expectationWithDescription("Download Meetup List")
        
        let success:(MeetupListResponse -> Void) = { (response) -> Void in
            XCTAssertNotNil(response.meta)
            XCTAssertNotNil(response.results)
            XCTAssertGreaterThan(response.results.count, 0)
            expectation.fulfill()
        }
        
        self.consumer.consume(self.apiTarget, success: success, failure: defaultFailureCheck(expectation))
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
    
    func testAPIConsumerResponseParse() {
        let stubResponse = stub(isHost("api.meetup.com")) { _ in
            return fixture(OHPathForFile("MeetupResponse.json", self.dynamicType)!, headers: ["Content-Type":"application/json"])
        }
        
        let expectation = self.expectationWithDescription("Download Meetup List")
        
        let success:(MeetupListResponse -> Void) = { (response) -> Void in
            
            defer {
                expectation.fulfill()
            }
            
            let meta = response.meta
            XCTAssertNotNil(meta)
            XCTAssertEqual(meta.totalCount, 49)
            XCTAssertEqual(meta.count, 3)
            
            let results = response.results
            XCTAssertNotNil(results)
            XCTAssertEqual(results.count, meta.count)
            
            guard let firstEvent = results.first else {
                return XCTAssertTrue(false, "The response should have at least one element")
            }
            
            XCTAssertEqual(firstEvent.headCount, 0)
            XCTAssertEqual(firstEvent.visibility, "public")
            XCTAssertEqual(firstEvent.meetDescription, "<p>Encontros todas as quintas, a partir das 19h, no Starbucks da Al. Santos, esquina com Al. Campinas, em SP, próximo ao metrô Trinon/Masp.</p> <p>Bate papo informal sobre iOS, OS X, Cocoa, Objective-C, Swift, etc..</p>")
            XCTAssertEqual(firstEvent.meetId, "dnvfpjyvdbhc")
        }
        
        self.consumer.consume(self.apiTarget, success: success, failure: defaultFailureCheck(expectation))
        self.waitForExpectationsWithTimeout(5, handler: nil)
        OHHTTPStubs.removeStub(stubResponse)
    }
    
    func testAPIConsumerFailure() {
        let stubResponse = stub(isHost("api.meetup.com")) { _ in
            return fixture(OHPathForFile("MeetupErrorResponse.json", self.dynamicType)!, status: 404, headers: ["Content-Type":"application/json"])
        }
        
        let expectation = self.expectationWithDescription("Download Meetup List")
        
        let success:(MeetupListResponse -> Void) = { (response) -> Void in
            expectation.fulfill()
            XCTAssertTrue(false, "This operation should fail")
        }
        
        let failure:(ErrorType -> Void) = { (error) -> Void in
            defer {
                expectation.fulfill()
            }
            switch error {
            case APIErrors.BadAPIResponse(let statusCode, let errorMessage):
                XCTAssertEqual(statusCode, 404)
                XCTAssertEqual(errorMessage, "{\"errors\":[{\"code\": \"group_error\",\"message\": \"Invalid group urlname\"}]}")
            default:
                XCTAssertTrue(false, "This method should fail for BadAPIResponse")
            }
        }
        
        self.consumer.consume(self.apiTarget, success: success, failure: failure)
        self.waitForExpectationsWithTimeout(5, handler: nil)
        OHHTTPStubs.removeStub(stubResponse)
    }
    
}
