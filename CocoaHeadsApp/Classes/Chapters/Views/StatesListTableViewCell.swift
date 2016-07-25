import UIKit
import RxSwift

class StatesListTableViewCell: UITableViewCell {

    let state = Variable<State?>(nil)
    let disposeBag = DisposeBag()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    private func commonInit() {
        state.asObservable().subscribeNext { [weak self] (state) in
            guard let state = state else {
                self?.imageView?.image = nil
                self?.textLabel?.text = "Estado desconhecido"
                self?.accessoryType = .None
                return
            }

            self?.imageView?.image = UIImage(named: state.iconName)
            self?.textLabel?.text = state.name
            self?.accessoryType = .DisclosureIndicator
        }.addDisposableTo(disposeBag)
    }
}