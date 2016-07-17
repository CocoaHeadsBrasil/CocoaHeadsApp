import Foundation

extension State {
    var iconName: String {
        return "flag-" + self.name
            .stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
            .stringByReplacingOccurrencesOfString(" ", withString: "-")
            .lowercaseString
    }
}