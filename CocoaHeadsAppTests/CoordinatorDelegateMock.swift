@testable import CocoaHeadsApp

class CoordinatorDelegateMock: CoordinatorDelegate {
    var ended = false
    func coordinateDidEnd(coordinator: Coordinator) {
        ended = true
    }
}
