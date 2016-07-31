@testable import CocoaHeadsApp
import Quick
import Nimble

class ChaptersListViewControllerTests: QuickSpec {

    var viewController: ChaptersListViewController!

    override func spec() {
        describe("ChaptersListViewController") {

            beforeEach {
                self.viewController = ChaptersListViewController()
            }

            describe("view loading") {

                beforeEach {
                    self.viewController.loadView()
                }

                it("should have a ChapterListView as its table view") {
                    expect(self.viewController.tableView).to(beAnInstanceOf(ChaptersListView))
                }

                it("should have a proper title") {
                    expect(self.viewController.title).to(equal("Capítulos"))
                }
            }
        }
    }
}