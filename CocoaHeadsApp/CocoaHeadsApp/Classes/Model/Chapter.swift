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
    let website: String?
    let githubURL: String?
    let twitterURL: String?
    let facebookURL: String?

    init(
        id: Int,
        stateId: Int,
        city: String,
        email: String,
        description: String? = nil,
        published: Bool,
        organizer: String? = nil,
        organizerEmail: String? = nil,
        organizerPhone: String? = nil,
        website: String? = nil,
        githubURL: String? = nil,
        twitterURL: String? = nil,
        facebookURL: String? = nil) {
            self.id = id;
            self.stateId = stateId
            self.city = city
            self.email = email
            self.description = description
            self.published = published
            self.organizer = organizer
            self.organizerEmail = organizerEmail
            self.organizerPhone = organizerPhone
            self.website = website
            self.githubURL = githubURL
            self.twitterURL = twitterURL
            self.facebookURL = facebookURL
    }
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
            website: string(json, key: "website"),
            githubURL: string(json, key: "github"),
            twitterURL: string(json, key: "twitter"),
            facebookURL: string(json, key: "facebook")
        )
    }
}