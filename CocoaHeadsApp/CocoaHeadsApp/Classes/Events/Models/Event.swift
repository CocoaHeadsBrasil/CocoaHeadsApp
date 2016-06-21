import Foundation
import CoreLocation

struct Event {
    let id: Int
    let name: String
    let description: String
    let chapterId: Int
    let venue: String
    let date: NSDate
    let address: String
    let location: CLLocationCoordinate2D?
    let passbook: String?
    let published: Bool
    let meetupURL: NSURL?
}

extension Event: JSONParselable {
    static func withJSON(json: [String : AnyObject]) -> Event? {
        guard let
            id = int(json, key: "id"),
            name = string(json, key: "nome"),
            description = string(json, key: "descricao"),
            date = nsdate(json, key: "data"),
            venue = string(json, key: "local"),
            address = string(json, key: "endereco"),
            published = bool(json, key: "published"),
            chapterId = int(json, key: "cidade_id")
            else {
                return nil
            }

        var location: CLLocationCoordinate2D? = nil
        if let latitude = double(json, key: "latitude"), longitude = double(json, key: "longitude") {
            location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }

        return Event(
            id: id,
            name: name,
            description: description,
            chapterId: chapterId,
            venue: venue,
            date: date,
            address: address,
            location: location,
            passbook: string(json, key: "passbook"),
            published: published,
            meetupURL: url(json, key: "meetup")
        )
    }
}