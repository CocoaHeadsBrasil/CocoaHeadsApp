enum Settings {
    case Acknowledgements
}

protocol SettingsViewModelDelegate: class {
    func userDidSelect(selectedValue: Settings)
}

class SettingsViewModel: ViewModel {
    
    let settings = [Settings.Acknowledgements]
    
    var delegate: SettingsViewModelDelegate
    
    init(delegate: SettingsViewModelDelegate) {
        self.delegate = delegate
    }
    
    func select(index index: Int) {
        guard index < settings.count else {
            return
        }
        
        let selectedValue = settings[index]
        self.delegate.userDidSelect(selectedValue)
    }
    
}