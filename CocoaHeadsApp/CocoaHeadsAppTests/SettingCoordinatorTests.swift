@testable import CocoaHeadsApp
import Quick
import Nimble
import CPDAcknowledgements

class SettingsCoordinatorTests: QuickSpec {
    
    var settingsCoordinator: SettingsCoordinator!
    var coordinatorDelegate: CoordinatorDelegateMock!

    override func spec() {
        describe("MeetupCoordinator") {
            beforeEach {
                self.coordinatorDelegate = CoordinatorDelegateMock()
                self.settingsCoordinator = SettingsCoordinator(delegate: self.coordinatorDelegate)
            }
            
            context("object creation") {
                it("should have animate set") {
                    expect(self.settingsCoordinator.animate) == true
                }
            }
            
            context("on start") {
                var result: UIViewController!
                
                beforeEach {
                    result = self.settingsCoordinator.start()
                }
                
                it("should return a navigationController") {
                    expect(result).to(beAnInstanceOf(UINavigationController.self))
                }
                
                it("should return a MeetupListViewController as rootViewController") {
                    let rootViewController = result as! UINavigationController
                    expect(rootViewController.viewControllers[0]).to(beAnInstanceOf(SettingsViewController))
                }
                
                context("settingsViewController") {
                    var settings: SettingsViewController!
                    var rootViewController: UINavigationController!
                    beforeEach{
                        self.settingsCoordinator.animate = false
                        rootViewController = result as! UINavigationController
                        settings = rootViewController.viewControllers[0] as! SettingsViewController
                    }
                    
                    it("should have the coordinator as delegate") {
                        expect(settings.delegate).to(be(self.settingsCoordinator))
                    }
                    
                    it("should navigate to CPDAcknowledgementsViewController on userDidSelect(.Acknowledgements)") {
                        settings.delegate.userDidSelect(.Acknowledgements)
                        expect(rootViewController.viewControllers[1]).to(beAnInstanceOf(CPDAcknowledgementsViewController.self))
                        
                    }
                }
                
                
            }
        }
    }
}