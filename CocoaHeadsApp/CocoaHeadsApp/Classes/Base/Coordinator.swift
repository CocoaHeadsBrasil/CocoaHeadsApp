import UIKit

protocol CoordinatorDelegate {
    func coordinateDidEnd(coordinator: Coordinator)
}

protocol Coordinator: class {
    func start() -> UIViewController
}

protocol ParentCoordinator: Coordinator {
    var childrenCoordinator: [Coordinator] {get set}
}

protocol ChildrenCoordinator: Coordinator {
    var delegate: CoordinatorDelegate? {get set}
}

extension ParentCoordinator where Self: CoordinatorDelegate {
    func coordinateDidEnd(coordinator: Coordinator) {
        if let coordinatorIndex = self.childrenCoordinator.indexOf({ $0 === coordinator }) {
            self.childrenCoordinator.removeAtIndex(coordinatorIndex)
        }
    }
}

class BaseCoordinator: ParentCoordinator, ChildrenCoordinator, CoordinatorDelegate {
    
    var childrenCoordinator = [Coordinator]()
    var delegate: CoordinatorDelegate?
    
    init(delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() -> UIViewController {
        fatalError("Method Start should be override")
    }
}