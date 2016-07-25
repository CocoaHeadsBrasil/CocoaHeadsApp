import RxSwift

struct StatesListViewModel {
    let items = Variable<[State]>([])

    init() {
        items.value = State.all()
    }
}