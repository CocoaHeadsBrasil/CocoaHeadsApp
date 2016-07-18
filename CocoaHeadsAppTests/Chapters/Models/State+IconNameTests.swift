@testable import CocoaHeadsApp
import Quick
import Nimble

class StateIconNameTests: QuickSpec {

    override func spec() {

        describe("icone name", {
            it("should return its correct icon name", closure: {
                expect(State.RJ.iconName).to(equal("flag-rio-de-janeiro"))
            })

            it("should return its correct icon name even with accents", closure: {
                expect(State.SP.iconName).to(equal("flag-sao-paulo"))
            })
        })
    }
}