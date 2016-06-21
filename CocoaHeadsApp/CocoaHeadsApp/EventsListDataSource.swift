import UIKit

class EventsListTableDataSource: NSObject, UITableViewDataSource {

    let viewModel :EventsListViewModel
    
    init(viewModel : EventsListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.value.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let reuseIdentifier = R.nib.eventsListTableViewCell.name
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        guard let eventsCell = cell as? EventsListTableViewCell else {
            return cell
        }
        
        //eventsCell.events.value = viewModel.items.value[indexPath.item]
        return eventsCell
    }

}
