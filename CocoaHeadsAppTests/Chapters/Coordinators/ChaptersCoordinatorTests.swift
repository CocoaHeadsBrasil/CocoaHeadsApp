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

            context("save", {

                it("should dismiss view controller") {
                    self.chaptersCoordinator.start()

                    let expectation = self.createExpectation()
                    self.async {
                        self.chaptersCoordinator.saveAndFinishCoordinator()
                        expectation.fulfill()
                    }

                    self.waitForExpectations()

                    expect(self.chaptersCoordinator.navigationController?.presentedViewController).to(beNil())
                }

                xit("should end coordinator") {
                }
            })
        }

        describe("StatesListViewControllerDelegate") {

            beforeEach {
                self.coordinatorDelegate = CoordinatorDelegateMock()
                self.chaptersCoordinator = ChaptersCoordinator(delegate: self.coordinatorDelegate)
                self.chaptersCoordinator.start()
            }

            context("did select state from list") {

                it("should push chapters list view controller") {
                    let expectation = self.createExpectation()
                    self.async {
                        self.chaptersCoordinator.statesListViewController(StatesListViewController(), didSelectState: .RJ)
                        expectation.fulfill()
                    }

                    self.waitForExpectations()

                    expect(self.chaptersCoordinator.navigationController?.topViewController).to(beAnInstanceOf(ChaptersListViewController))
                }
            }
        }
    }
}