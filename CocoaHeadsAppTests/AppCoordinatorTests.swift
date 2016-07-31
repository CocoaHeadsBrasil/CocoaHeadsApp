@testable import CocoaHeadsApp
import Quick
import Nimble

class AppCoordinatorTests: QuickSpec {
    
    var appCoordinator: AppCoordinator!
    
    override func spec() {
        describe("AppCoordinator") {
            
            beforeEach {
                self.appCoordinator = AppCoordinator()
            }
            
            context("On start") {
                var returnController: UIViewController!
                beforeEach {
                    returnController = self.appCoordinator.start()
                }
                
                it("should create a window") {
                    expect(self.appCoordinator.window) != nil
                }
                
                it("should set the key window") {
                    expect(self.appCoordinator.window.keyWindow).to(beTrue())
                }

                it("should set the return viewController on the window") {
                    expect(self.appCoordinator.window.rootViewController) == returnController
                }

                it("should create two children coordinator") {
                    expect(self.appCoordinator.childrenCoordinator.count) == 1
                }

                it("should create a meetupCoordinator") {
                    expect(self.appCoordinator.childrenCoordinator[0] as? MeetupCoordinator).toNot(beNil())
                }
            }
        }
    }
}
