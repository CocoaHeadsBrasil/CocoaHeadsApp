import UIKit
import RxSwift

class MeetupListView: NibDesignable {

    let viewModel = MeetupListViewModel()
    var dataSource :MeetupListCollectionDataSource!
    var delegate :MeetupListCollectionDelegate!

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var listCollectionView :UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listCollectionView.registerNib(R.nib.meetupListCollectionViewCell)
        self.dataSource = MeetupListCollectionDataSource(viewModel: self.viewModel)
        self.delegate = MeetupListCollectionDelegate(viewModel: self.viewModel)
        self.listCollectionView.dataSource = self.dataSource
        self.listCollectionView.delegate = self.delegate
        viewModel.items.asObservable().subscribeNext { [weak self] (items) in
            self?.listCollectionView.reloadData()
        }.addDisposableTo(self.disposeBag)
        viewModel.loadMoreItens()
    }
    
}
