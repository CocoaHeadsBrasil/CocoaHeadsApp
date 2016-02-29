import Foundation
import CoreLocation

class Event {
    
    var id: Int?
    var name: String?
    var description: String?
    var chapter: Chapter?
    var venue: String?
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
        
        //TODO date
        
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
