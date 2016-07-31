import UIKit

class ChaptersListView: UITableView {

    var chaptersListDataSource: SimpleListDataSource<String, UITableViewCell>!
    var chaptersListDelegate: ChaptersListDelegate!

    init() {
        super.init(frame: .zero, style: .Plain)

        registerCell(UITableViewCell)

        var viewModel = SimpleListViewModel<String, UITableViewCell>()
        viewModel.items.value = ["Campinas", "São Paulo"]
        viewModel.configurationBlock = { (cell, chapter) in
            cell.textLabel?.text = chapter
        }

        chaptersListDataSource = SimpleListDataSource<String, UITableViewCell>(viewModel: viewModel)
        dataSource = chaptersListDataSource

        chaptersListDelegate = ChaptersListDelegate()
        delegate = chaptersListDelegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}