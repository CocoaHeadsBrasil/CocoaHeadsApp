import UIKit

class EventsListViewModel: ViewModel {
    
    var numberOfItemsPerRequest = 20
    var currentPage = 0
    let items = Dynamic<[Event]>([])
}
