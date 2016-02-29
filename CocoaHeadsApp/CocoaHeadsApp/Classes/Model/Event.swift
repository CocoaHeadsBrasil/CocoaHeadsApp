import Foundation
import CoreLocation

struct Event {
    
    var id: Int?
    var name: String?
    var description: String?
    var chapter: Chapter?
    var venue: String?
    var date: NSDate?
    var address: String?
    var location: CLLocationCoordinate2D?
    var passbook: String?
    var published: Bool?
    var meetupURL: NSURL?

    init(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["nome"] as? String
        description = dictionary["descricao"] as? String
        
        chapter = Chapter()
        chapter?.id = dictionary["cidade_id"] as? Int
        
        if let date = dictionary["data"] as? String {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            self.date = formatter.dateFromString(date)
        }
        
        venue = dictionary["local"] as? String
        address = dictionary["endereco"] as? String
        
        if let latitude = dictionary["latitude"] as? String, let longitude = dictionary["longitude"] as? String {
                location = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        }
        
        passbook = dictionary["passbook"] as? String
        published = dictionary["published"] as? Bool
        
        if let url = dictionary["meetup"] as? String {
            meetupURL = NSURL(string: url)
        }
    }
}
