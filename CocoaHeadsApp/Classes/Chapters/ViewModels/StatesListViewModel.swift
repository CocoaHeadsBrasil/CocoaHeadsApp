import RxSwift

struct StatesListViewModel {
    let items = Variable<[State]>([])
    var selectionCallback: ((State) -> ())?

    init() {
        items.value = State.all()
    }
}