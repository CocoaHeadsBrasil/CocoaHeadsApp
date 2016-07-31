import UIKit

class ChaptersListView: UITableView {

    var chaptersListDataSource: ChaptersListDataSource!
    var chaptersListDelegate: ChaptersListDelegate!

    init() {
        super.init(frame: .zero, style: .Plain)

        registerCell(UITableViewCell)

        let viewModel = ChaptersListViewModel()

        chaptersListDataSource = ChaptersListDataSource(viewModel: viewModel)
        dataSource = chaptersListDataSource

        chaptersListDelegate = ChaptersListDelegate()
        delegate = chaptersListDelegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}