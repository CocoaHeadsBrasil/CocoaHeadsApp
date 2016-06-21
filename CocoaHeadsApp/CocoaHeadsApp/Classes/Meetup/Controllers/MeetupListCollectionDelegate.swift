import UIKit

class MeetupListCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {

    let viewModel:MeetupListViewModel
    
    init(viewModel:MeetupListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard indexPath.item > viewModel.items.value.count - 5 else {
            return
        }
        viewModel.loadMoreItens()
    }
    
}
