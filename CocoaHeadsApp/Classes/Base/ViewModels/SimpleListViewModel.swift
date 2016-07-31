import RxSwift

struct SimpleListViewModel<T, CellType: UITableViewCell> {
    let items = Variable<[T]>([])
    var selectionCallback: ((T) -> ())?
    var configurationBlock: ((CellType, T) -> ())?
}