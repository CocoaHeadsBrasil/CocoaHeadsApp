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
                
                it("should return a Tabbar controller") {
                    expect(returnController).to(beAKindOf(UITabBarController.self))
                }
                
                it("should set the return viewController on the window") {
                    expect(self.appCoordinator.window.rootViewController) == returnController
                }
                
                it("return tabbar should have two navigation controllers") {
                    let tabbarController = returnController as! UITabBarController
                    expect(tabbarController.viewControllers!.count) == 2
                }
                
                it("return tabbar should have a MeetupViewController as first controller on a navigationController") {
                    let tabbarController = returnController as! UITabBarController
                    let navigationController = tabbarController.viewControllers![0] as! UINavigationController
                    expect(navigationController.viewControllers[0]).to(beAKindOf(MeetupListViewController.self))
                }
                
                it("return tabbar should have a SettingsViewController as second controller") {
                    let tabbarController = returnController as! UITabBarController
                    let navigationController = tabbarController.viewControllers![1 ] as! UINavigationController
                    expect(navigationController.viewControllers[0]).to(beAKindOf(SettingsViewController.self))
                }
                
                it("should create two children coordinator") {
                    expect(self.appCoordinator.childrenCoordinator.count) == 2
                }
                
                it("should create a meetupCoordinator") {
                    expect(self.appCoordinator.childrenCoordinator[0] as? MeetupCoordinator).toNot(beNil())
                }
                
                it("should create a settingCoordinator") {
                    expect(self.appCoordinator.childrenCoordinator[1] as? SettingsCoordinator).toNot(beNil())
                }
            }
        }
    }
}
