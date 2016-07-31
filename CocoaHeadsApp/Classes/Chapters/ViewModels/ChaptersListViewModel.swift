import RxSwift

struct ChaptersListViewModel {

    let items = Variable<[String]>([])
    var selectionCallback: ((String) -> ())?

    init() {
        items.value = [
            "Campinas",
            "São Paulo"
        ]
    }
}