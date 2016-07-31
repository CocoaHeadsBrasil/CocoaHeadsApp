import XCTest

extension XCTestCase {

    func createExpectation() -> XCTestExpectation {
        return expectationWithDescription("async method call")
    }

    func waitForExpectations() {
        waitForExpectationsWithTimeout(10, handler: nil)
    }

    func async(closure: () -> ()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_MSEC)), dispatch_get_main_queue()) {
            closure()
        }
    }
}
