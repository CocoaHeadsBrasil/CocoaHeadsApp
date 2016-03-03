import Foundation

struct Chapter {
    let id: Int
    let stateId: Int
    let city: String
    let email: String
    let description: String?
    let published: Bool
    let organizer: String?
    let organizerEmail: String?
    let organizerPhone: String?
    let website: NSURL?
    let githubURL: NSURL?
    let twitterURL: NSURL?
    let facebookURL: NSURL?
}

extension Chapter: JSONParselable {
    static func withJSON(json: [String : AnyObject]) -> Chapter? {
        guard let
            id = int(json, key: "id"),
            stateId = int(json, key: "estado_id"),
            city = string(json, key: "cidade"),
            email = string(json, key: "email"),
            published = bool(json, key: "published")
            else {
                return nil
            }

        return Chapter(
            id: id,
            stateId: stateId,
            city: city,
            email: email,
            description: string(json, key: "descricao"),
            published: published,
            organizer: string(json, key: "organizador"),
            organizerEmail: string(json, key: "organizador_email"),
            organizerPhone: string(json, key: "organizador_contato"),
            website: url(json, key: "website"),
            githubURL: url(json, key: "github"),
            twitterURL: url(json, key: "twitter"),
            facebookURL: url(json, key: "facebook")
        )
    }
}