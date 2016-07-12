import UIKit
import MapKit
import RxSwift

class MeetupListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var meetupTitleLabel :UILabel!
    @IBOutlet weak var meetupLongDateLabel :UILabel!
    @IBOutlet weak var meetupDateTimeLabel :UILabel!
    @IBOutlet weak var meetupPlaceDescriptionLabel :UILabel!
    @IBOutlet weak var meetupMapView :MKMapView!
    
    let meetup = Variable<MeetupModel?>(nil)
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        commonInit()
    }
    
    private func commonInit() {
        self.meetup.asObservable().subscribeNext { [weak self] (meetup) in
            self?.meetupTitleLabel.text = meetup?.name ?? "Indisponível"
            self?.meetupPlaceDescriptionLabel.text = meetup?.venue?.address1 ?? "Indisponível"
            self?.meetupLongDateLabel.text = meetup?.eventDateTempo.format("dd 'de' MMMM 'de' YYYY")
            self?.meetupDateTimeLabel.text = meetup?.eventDateTempo.format("HH:mm")
            
            if let latitude = meetup?.venue?.lat, longitude = meetup?.venue?.lon {
                    var region = MKCoordinateRegion()
                    region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    self?.meetupMapView.setRegion(region, animated: false)
            }
        }.addDisposableTo(self.disposeBag)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.meetup.value = nil
    }
    
}
