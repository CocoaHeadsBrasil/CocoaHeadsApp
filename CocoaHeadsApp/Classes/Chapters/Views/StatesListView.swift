import UIKit

class StatesListView: UITableView {

    var statesListDataSource: SimpleListDataSource<State, StatesListTableViewCell>!
    var statesListDelegate: StatesListDelegate!

    init(selectionCallback: (State) -> ()) {
        super.init(frame: .zero, style: .Plain)

        registerCell(StatesListTableViewCell)

        var viewModel = SimpleListViewModel<State, StatesListTableViewCell>()
        viewModel.items.value = State.all()
        viewModel.selectionCallback = selectionCallback
        viewModel.configurationBlock = { (cell, state) in
            cell.state.value = state
        }

        statesListDataSource = SimpleListDataSource<State, StatesListTableViewCell>(viewModel: viewModel)
        dataSource = statesListDataSource

        statesListDelegate = StatesListDelegate(viewModel: viewModel)
        delegate = statesListDelegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
