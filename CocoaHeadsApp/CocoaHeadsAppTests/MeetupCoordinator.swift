@testable import CocoaHeadsApp
import Quick
import Nimble


class MeetupCoordinatorTests: QuickSpec {
    
    var meetupCoordinator: MeetupCoordinator!
    var coordinatorDelegate: CoordinatorDelegateMock!
    
    override func spec() {
        describe("MeetupCoordinator") {
            beforeEach {
                self.coordinatorDelegate = CoordinatorDelegateMock()
                self.meetupCoordinator = MeetupCoordinator(delegate: self.coordinatorDelegate)
            }
            
            context("on start") {
                var result: UIViewController!
                
                beforeEach {
                    result = self.meetupCoordinator.start()
                }
                
                it("should return a navigationController") {
                    expect(result).to(beAnInstanceOf(UINavigationController.self))
                }
                
                it("should return a MeetupListViewController as rootViewController") {
                    let rootViewController = result as! UINavigationController
                    expect(rootViewController.viewControllers[0]).to(beAnInstanceOf(MeetupListViewController))
                }
            }
        }
    }
}