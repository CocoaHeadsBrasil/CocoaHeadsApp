import UIKit

class StatesListView: UITableView {

    var statesListDataSource: StatesListDataSource!
    var statesListDelegate: StatesListDelegate!

    init(selectionCallback: (State) -> ()) {
        super.init(frame: .zero, style: .Plain)

        registerCell(StatesListTableViewCell)

        var viewModel = StatesListViewModel()
        viewModel.selectionCallback = selectionCallback

        statesListDataSource = StatesListDataSource(viewModel: viewModel)
        dataSource = statesListDataSource

        statesListDelegate = StatesListDelegate(viewModel: viewModel)
        delegate = statesListDelegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
