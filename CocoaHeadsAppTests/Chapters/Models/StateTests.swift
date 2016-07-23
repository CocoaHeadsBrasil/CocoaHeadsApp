@testable import CocoaHeadsApp
import Quick
import Nimble

class StateTests: QuickSpec {

    override func spec() {
        describe("State") {

            context("name", {

                it("should return its raw value as its name", closure: { 
                    expect(State.RJ.name).to(equal("Rio de Janeiro"))
                })
            })
        }
    }
}