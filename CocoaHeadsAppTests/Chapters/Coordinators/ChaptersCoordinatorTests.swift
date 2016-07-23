@testable import CocoaHeadsApp
import Quick
import Nimble

class ChaptersCoordinatorTests: QuickSpec {

    var chaptersCoordinator: ChaptersCoordinator!
    var coordinatorDelegate: CoordinatorDelegateMock!

    override func spec() {
        describe("ChaptersCoordinator") { 
            beforeEach {
                self.coordinatorDelegate = CoordinatorDelegateMock()
                self.chaptersCoordinator = ChaptersCoordinator(delegate: self.coordinatorDelegate)
            }

            context("on start", { 
                var result: UIViewController!

                beforeEach {
                    result = self.chaptersCoordinator.start()
                }

                it("should return a navigationController") {
                    expect(result).to(beAnInstanceOf(UINavigationController))
                }

                it("should return a StatesListViewController as its rootViewController") {
                    let rootViewController = result as! UINavigationController
                    expect(rootViewController.viewControllers[0]).to(beAnInstanceOf(StatesListViewController))
                }
            })
        }
    }
}