import UIKit

class StatesListView: UITableView {

    var statesListDataSource: StatesListDataSource!
    var statesListDelegate: StatesListDelegate!

    init() {
        super.init(frame: .zero, style: .Plain)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        registerCell(StatesListTableViewCell)
        statesListDataSource = StatesListDataSource(viewModel: StatesListViewModel())
        dataSource = statesListDataSource

        statesListDelegate = StatesListDelegate()
        delegate = statesListDelegate
    }
}